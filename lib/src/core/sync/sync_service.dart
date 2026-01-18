import 'dart:async';

import 'package:contrack/src/core/network/network_info.dart';
import 'package:contrack/src/core/sync/app_sync_status.dart';
import 'package:contrack/src/core/sync/sync_action.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

abstract class SyncService {
  Stream<bool> get isSyncing;
  Stream<AppSyncStatus> get status;
  Future<void> syncNow();
  void dispose();
}

@LazySingleton(as: SyncService)
/// Orchestrator: Responsible for managing the synchronization lifecycle.
///
/// Responsibilities:
/// 1. Monitoring network connectivity.
/// 2. Scheduling periodic syncs.
/// 3. Fetching batch data from Remote (Pull).
/// 4. Identifying local changes to be pushed (Push candidates).
/// 5. Delegating atomic operations to [SyncAction].
class SyncServiceImpl implements SyncService {
  final NetworkInfo _networkInfo;
  final SyncAction _syncAction;
  final Logger _logger = Logger('SyncServiceImpl');

  final _isSyncingController = BehaviorSubject<bool>.seeded(false);
  Timer? _periodicSyncTimer;
  StreamSubscription? _networkSubscription;
  bool _isDisposed = false;

  static const _syncInterval = Duration(minutes: 3);
  static const _batchSize = 50;

  SyncServiceImpl(this._networkInfo, this._syncAction) {
    _networkSubscription = _networkInfo.onStatusChange.listen((status) {
      if (status == InternetStatus.connected) {
        _startPeriodicSync();
      } else {
        _stopPeriodicSync();
      }
    });
  }

  @override
  Stream<bool> get isSyncing => _isSyncingController.stream.distinct();

  @override
  Stream<AppSyncStatus> get status =>
      Rx.combineLatest2<InternetStatus, bool, AppSyncStatus>(
        _networkInfo.onStatusChange,
        isSyncing,
        (internetStatus, isSyncing) {
          if (internetStatus == InternetStatus.disconnected) {
            return AppSyncStatus.offline;
          }
          if (isSyncing) {
            return AppSyncStatus.syncing;
          }
          return AppSyncStatus.online;
        },
      ).distinct();

  void _startPeriodicSync() {
    _stopPeriodicSync();
    _periodicSyncTimer = Timer.periodic(_syncInterval, (_) => _sync());
  }

  void _stopPeriodicSync() {
    _periodicSyncTimer?.cancel();
    _periodicSyncTimer = null;
  }

  Future<void> _sync() async {
    if (_isDisposed || _isSyncingController.value) return;

    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) return;

    _isSyncingController.add(true);

    try {
      await _performSync();
    } catch (e, stackTrace) {
      _logger.severe('Sync failed', e, stackTrace);
    } finally {
      if (!_isDisposed) {
        _isSyncingController.add(false);
      }
    }
  }

  @override
  Future<void> syncNow() async {
    if (_isDisposed) return;

    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) return;

    if (_isSyncingController.value) return;

    _stopPeriodicSync();

    _isSyncingController.add(true);

    try {
      await _performSync();
      _startPeriodicSync();
    } catch (e, stackTrace) {
      _logger.severe('Manual sync failed', e, stackTrace);
    } finally {
      if (!_isDisposed) {
        _isSyncingController.add(false);
      }
    }
  }

  Future<void> _performSync() async {
    try {
      await _performPushSync();
    } catch (e, stackTrace) {
      _logger.severe('Push sync failed', e, stackTrace);
    }

    if (!_isDisposed) {
      try {
        await _performPullSync();
      } catch (e, stackTrace) {
        _logger.severe('Pull sync failed', e, stackTrace);
      }
    }
  }

  Future<void> _performPushSync() async {
    final projectsSynced = await _performProjectSync();
    final usersSynced = await _performUserSync();
    final totalSynced = projectsSynced + usersSynced;

    if (totalSynced > 0) {
      _logger.info('Pushed $totalSynced items');
    }
  }

  Future<void> _performPullSync() async {
    await _pullAndSyncGeopoliticalZones();
    await _pullAndSyncAgencies();
    await _pullAndSyncMinistries();
    await _pullAndSyncStates();

    final user = await _syncAction.getActiveSessionUser();
    if (user != null) {
      await _pullAndSyncProfiles();
      await _pullAndSyncProjects(currentUserId: user.uid);
    }
  }

  Future<void> _pullAndSyncProjects({required String? currentUserId}) async {
    try {
      final projectsData = await _syncAction.fetchRemoteProjects();
      for (final projectData in projectsData) {
        if (_isDisposed) break;
        try {
          await _syncAction.upsertRemoteProject(projectData, currentUserId);
        } catch (e, stackTrace) {
          _logger.warning('Failed to sync incoming project', e, stackTrace);
        }
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to pull projects', e, stackTrace);
    }
  }

  Future<void> _pullAndSyncGeopoliticalZones() async {
    final response = await _syncAction.fetchRemoteGeopoliticalZones();
    for (final item in response) {
      await _syncAction.upsertRemoteGeopoliticalZone(item);
    }
  }

  Future<void> _pullAndSyncAgencies() async {
    final response = await _syncAction.fetchRemoteAgencies();
    for (final item in response) {
      await _syncAction.upsertRemoteAgency(item);
    }
  }

  Future<void> _pullAndSyncMinistries() async {
    final response = await _syncAction.fetchRemoteMinistries();
    for (final item in response) {
      await _syncAction.upsertRemoteMinistry(item);
    }
  }

  Future<void> _pullAndSyncStates() async {
    final response = await _syncAction.fetchRemoteStates();
    for (final item in response) {
      await _syncAction.upsertRemoteState(item);
    }
  }

  Future<void> _pullAndSyncProfiles() async {
    final response = await _syncAction.fetchRemoteProfiles();
    for (final profile in response) {
      await _syncAction.upsertRemoteProfile(profile);
    }
  }

  Future<int> _performProjectSync() async {
    int synced = 0;

    while (!_isDisposed) {
      final results = await _syncAction.getUnsyncedProjects(limit: _batchSize);

      if (results.isEmpty) break;

      for (final item in results) {
        if (_isDisposed) break;

        try {
          await _syncAction.pushProject(
            item.project,
            item.agencyRemoteId,
            item.ministryRemoteId,
            item.stateRemoteId,
            item.zoneRemoteId,
            item.createdByRemoteId,
            item.modifiedByRemoteId,
          );
          synced++;
        } catch (e, stackTrace) {
          _logger.severe(
            'Failed to sync project ${item.project.code}',
            e,
            stackTrace,
          );
        }
      }

      if (results.length < _batchSize) break;
    }

    return synced;
  }

  Future<int> _performUserSync() async {
    int synced = 0;

    while (!_isDisposed) {
      final unsyncedUsers = await _syncAction.getUnsyncedUsers(
        limit: _batchSize,
      );

      if (unsyncedUsers.isEmpty) break;

      for (final user in unsyncedUsers) {
        if (_isDisposed) break;

        try {
          await _syncAction.pushUser(user);
          synced++;
        } catch (e, stackTrace) {
          _logger.severe('Failed to sync user ${user.username}', e, stackTrace);
        }
      }

      if (unsyncedUsers.length < _batchSize) break;
    }

    return synced;
  }

  @override
  void dispose() {
    _isDisposed = true;
    _stopPeriodicSync();
    _networkSubscription?.cancel();
    _isSyncingController.close();
  }
}

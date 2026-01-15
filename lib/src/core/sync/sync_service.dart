import 'dart:async';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/network/network_info.dart';
import 'package:contrack/src/core/sync/app_sync_status.dart';
import 'package:contrack/src/core/sync/sync_action.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SyncService {
  Stream<bool> get isSyncing;
  Stream<AppSyncStatus> get status;
  Future<void> syncNow();
  void dispose();
}

@LazySingleton(as: SyncService)
class SyncServiceImpl implements SyncService {
  final NetworkInfo _networkInfo;
  final AppDatabase _database;
  final SyncAction _syncAction;
  final SupabaseClient _supabase;
  final Logger _logger = Logger('SyncServiceImpl');

  final _isSyncingController = BehaviorSubject<bool>.seeded(false);
  Timer? _periodicSyncTimer;
  StreamSubscription? _networkSubscription;
  bool _isDisposed = false;

  static const _syncInterval = Duration(minutes: 15);
  static const _batchSize = 50;

  SyncServiceImpl(
    this._networkInfo,
    this._database,
    this._syncAction,
    this._supabase,
  ) {
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

    final session =
        await (_database.select(_database.sessions)
              ..limit(1)
              ..orderBy([
                (t) => OrderingTerm(
                  expression: t.createdAt,
                  mode: OrderingMode.desc,
                ),
              ]))
            .getSingleOrNull();

    if (session != null && session.activeUserId != null) {
      final user = await (_database.select(
        _database.users,
      )..where((t) => t.id.equals(session.activeUserId!))).getSingleOrNull();

      if (user != null &&
          (user.role == UserRole.admin || user.role == UserRole.superAdmin)) {
        await _pullAndSyncProfiles();
      }

      await _pullAndSyncProjects(currentUserId: session.activeUserId);
    }
  }

  Future<void> _pullAndSyncProjects({required int? currentUserId}) async {
    try {
      final response = await _supabase.from('projects').select();
      final projectsData = response as List<dynamic>;

      for (final projectData in projectsData) {
        if (_isDisposed) break;
        try {
          await _syncAction.updateLocalFromRemoteProject(
            projectData as Map<String, dynamic>,
            currentUserId,
          );
        } catch (e, stackTrace) {
          _logger.warning('Failed to sync incoming project', e, stackTrace);
        }
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to pull projects', e, stackTrace);
    }
  }

  Future<void> _pullAndSyncGeopoliticalZones() async {
    final response = await _supabase.from('geopolitical_zones').select();
    for (final item in response) {
      await _syncAction.updateLocalFromRemoteGeopoliticalZone(item);
    }
  }

  Future<void> _pullAndSyncAgencies() async {
    final response = await _supabase.from('agencies').select();
    for (final item in response) {
      await _syncAction.updateLocalFromRemoteAgency(item);
    }
  }

  Future<void> _pullAndSyncMinistries() async {
    final response = await _supabase.from('ministries').select();
    for (final item in response) {
      await _syncAction.updateLocalFromRemoteMinistry(item);
    }
  }

  Future<void> _pullAndSyncStates() async {
    final response = await _supabase.from('states').select();
    for (final item in response) {
      await _syncAction.updateLocalFromRemoteState(item);
    }
  }

  Future<void> _pullAndSyncProfiles() async {
    final response = await _supabase.from('profiles').select();
    for (final item in response) {
      await _syncAction.updateLocalFromRemoteProfile(item);
    }
  }

  Future<int> _performProjectSync() async {
    int synced = 0;

    while (!_isDisposed) {
      final createdByUser = _database.alias(_database.users, 'created_by_user');
      final modifiedByUser = _database.alias(
        _database.users,
        'modified_by_user',
      );

      final query =
          _database.select(_database.projects).join([
              leftOuterJoin(
                _database.agencies,
                _database.agencies.id.equalsExp(_database.projects.agencyId),
              ),
              leftOuterJoin(
                _database.ministries,
                _database.ministries.id.equalsExp(
                  _database.projects.ministryId,
                ),
              ),
              leftOuterJoin(
                _database.states,
                _database.states.id.equalsExp(_database.projects.stateId),
              ),
              leftOuterJoin(
                _database.geopoliticalZones,
                _database.geopoliticalZones.id.equalsExp(
                  _database.projects.zoneId,
                ),
              ),
              leftOuterJoin(
                createdByUser,
                createdByUser.id.equalsExp(_database.projects.createdBy),
              ),
              leftOuterJoin(
                modifiedByUser,
                modifiedByUser.id.equalsExp(_database.projects.modifiedBy),
              ),
            ])
            ..where(_database.projects.isSynced.equals(false))
            ..orderBy([
              OrderingTerm(
                expression: _database.projects.createdAt,
                mode: OrderingMode.asc,
              ),
            ])
            ..limit(_batchSize);

      final results = await query.get();

      if (results.isEmpty) break;

      for (final row in results) {
        if (_isDisposed) break;

        final project = row.readTable(_database.projects);
        final agencyRemoteId = row
            .readTableOrNull(_database.agencies)
            ?.remoteId;
        final ministryRemoteId = row
            .readTableOrNull(_database.ministries)
            ?.remoteId;
        final stateRemoteId = row.readTableOrNull(_database.states)?.remoteId;
        final zoneRemoteId = row
            .readTableOrNull(_database.geopoliticalZones)
            ?.remoteId;
        final createdByRemoteId = row.readTableOrNull(createdByUser)?.uid;
        final modifiedByRemoteId = row.readTableOrNull(modifiedByUser)?.uid;

        try {
          await _syncAction.syncProject(
            project,
            agencyRemoteId,
            ministryRemoteId,
            stateRemoteId,
            zoneRemoteId,
            createdByRemoteId,
            modifiedByRemoteId,
          );
          synced++;
        } catch (e, stackTrace) {
          _logger.severe(
            'Failed to sync project ${project.code}',
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
      final unsyncedUsers =
          await (_database.select(_database.users)
                ..where((t) => t.isSynced.equals(false))
                ..orderBy([
                  (t) => OrderingTerm(
                    expression: t.createdAt,
                    mode: OrderingMode.asc,
                  ),
                ])
                ..limit(_batchSize))
              .get();

      if (unsyncedUsers.isEmpty) break;

      for (final user in unsyncedUsers) {
        if (_isDisposed) break;

        try {
          await _syncAction.syncUser(user);
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

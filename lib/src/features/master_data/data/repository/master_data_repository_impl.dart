import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/features/master_data/data/datasource/master_data_local_datasource.dart';
import 'package:contrack/src/features/master_data/data/datasource/master_data_remote_datasource.dart';
import 'package:contrack/src/features/master_data/data/models/agency_with_ministry.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@LazySingleton(as: MasterDataRepository)
class MasterDataRepositoryImpl implements MasterDataRepository {
  MasterDataRepositoryImpl(
    this._localDatasource,
    this._remoteDatasource,
    this._userSession,
  );
  final MasterDataLocalDatasource _localDatasource;
  final MasterDataRemoteDatasource _remoteDatasource;
  final UserSession _userSession;
  final Logger _logger = Logger('MasterDataRepositoryImpl');

  @override
  Future<void> addMinistry({required String name, required String code}) async {
    _ensureAdminPermission();
    final ministry = await _localDatasource.addMinistry(name: name, code: code);
    try {
      final newRemoteId = await _remoteDatasource.addMinistry(ministry);
      await _localDatasource.updateMinistry(
        ministry.copyWith(remoteId: Value(newRemoteId)),
      );
    } catch (_) {
      _logger.warning('Failed to add ministry to remote');
    }
  }

  @override
  Future<void> addAgency({
    required String name,
    required String code,
    required int ministryId,
    String? ministryRemoteId,
  }) async {
    _ensureAdminPermission();
    final agency = await _localDatasource.addAgency(
      name: name,
      code: code,
      ministryId: ministryId,
    );
    try {
      var ministry = await _localDatasource.getMinistryById(ministryId);
      if (ministry != null) {
        if (ministry.remoteId == null) {
          final remoteId = await _remoteDatasource.getMinistryRemoteIdByCode(
            ministry.code,
          );
          if (remoteId != null) {
            ministry = ministry.copyWith(
              remoteId: Value(remoteId),
              isSynced: true,
              lastSyncedAt: Value(DateTime.now()),
            );
            await _localDatasource.updateMinistry(ministry);
          } else {
            final newMinistryRemoteId = await _remoteDatasource.addMinistry(
              ministry,
            );
            ministry = ministry.copyWith(
              remoteId: Value(newMinistryRemoteId),
              isSynced: true,
              lastSyncedAt: Value(DateTime.now()),
            );
            await _localDatasource.updateMinistry(ministry);
          }
        }

        final agencyWithMinistry = AgencyWithMinistry(
          agency: agency,
          ministry: ministry,
        );
        final newAgencyRemoteId = await _remoteDatasource.addAgency(
          agencyWithMinistry,
        );
        await _localDatasource.updateAgency(
          agency.copyWith(
            remoteId: Value(newAgencyRemoteId),
            isSynced: true,
            lastSyncedAt: Value(DateTime.now()),
          ),
        );
      }
    } catch (e) {
      _logger.warning('Failed to add agency to remote: $e');
    }
  }

  @override
  Future<void> deleteMinistry(Ministry ministry) async {
    _ensureAdminPermission();
    await _localDatasource.deleteMinistry(ministry);
    try {
      await _remoteDatasource.deleteMinistry(ministry);
    } catch (_) {
      _logger.warning('Failed to delete ministry from remote');
    }
  }

  @override
  Future<void> deleteAgency(Agency agency) async {
    _ensureAdminPermission();
    await _localDatasource.deleteAgency(agency);
    try {
      await _remoteDatasource.deleteAgency(agency);
    } catch (_) {
      _logger.warning('Failed to delete agency from remote');
    }
  }

  @override
  Future<void> updateMinistry(Ministry ministry) async {
    _ensureAdminPermission();
    await _localDatasource.updateMinistry(ministry);
    try {
      await _remoteDatasource.updateMinistry(ministry);
    } catch (_) {
      _logger.warning('Failed to update ministry from remote');
    }
  }

  @override
  Future<void> updateAgency(Agency agency) async {
    _ensureAdminPermission();
    await _localDatasource.updateAgency(agency);
    try {
      final ministry = await _localDatasource.getMinistryById(
        agency.ministryId,
      );
      if (ministry != null) {
        final agencyWithMinistry = AgencyWithMinistry(
          agency: agency,
          ministry: ministry,
        );
        await _remoteDatasource.updateAgency(agencyWithMinistry);
      }
    } catch (_) {
      _logger.warning('Failed to update agency from remote');
    }
  }

  @override
  Stream<List<Ministry>> watchMinistries({String? query}) {
    return _localDatasource.watchMinistries(query: query);
  }

  @override
  Stream<List<AgencyWithMinistry>> watchAgencies({
    String? query,
    int? ministryId,
  }) {
    return _localDatasource.watchAgencies(query: query, ministryId: ministryId);
  }

  void _ensureAdminPermission() {
    final user = _userSession.currentUser;
    if (user == null || !user.role.isAnyAdmin) {
      throw Exception('Unauthorized access');
    }
  }
}

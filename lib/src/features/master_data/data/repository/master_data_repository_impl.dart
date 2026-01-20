import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/features/master_data/data/datasource/master_data_local_datasource.dart';
import 'package:contrack/src/features/master_data/data/datasource/master_data_remote_datasource.dart';
import 'package:contrack/src/features/master_data/data/models/ministry_with_agency.dart';
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
  Future<void> addAgency({required String name, required String code}) async {
    _ensureAdminPermission();
    final agency = await _localDatasource.addAgency(name: name, code: code);
    try {
      final newRemoteId = await _remoteDatasource.addAgency(agency);
      await _localDatasource.updateAgency(
        agency.copyWith(remoteId: Value(newRemoteId)),
      );
    } catch (_) {
      _logger.warning('Failed to add agency to remote');
    }
  }

  @override
  Future<void> addMinistry({
    required String name,
    required String code,
    required int agencyId,
    String? agencyRemoteId,
  }) async {
    _ensureAdminPermission();
    final ministry = await _localDatasource.addMinistry(
      name: name,
      code: code,
      agencyId: agencyId,
    );
    try {
      var agency = await _localDatasource.getAgencyById(agencyId);
      if (agency != null) {
        if (agency.remoteId == null) {
          final remoteId = await _remoteDatasource.getAgencyRemoteIdByCode(
            agency.code,
          );
          if (remoteId != null) {
            agency = agency.copyWith(
              remoteId: Value(remoteId),
              isSynced: true,
              lastSyncedAt: Value(DateTime.now()),
            );
            await _localDatasource.updateAgency(agency);
          } else {
            final newAgencyRemoteId = await _remoteDatasource.addAgency(agency);
            agency = agency.copyWith(
              remoteId: Value(newAgencyRemoteId),
              isSynced: true,
              lastSyncedAt: Value(DateTime.now()),
            );
            await _localDatasource.updateAgency(agency);
          }
        }

        final ministryWithAgency = MinistryWithAgency(
          ministry: ministry,
          agency: agency,
        );
        final newMinistryRemoteId = await _remoteDatasource.addMinistry(
          ministryWithAgency,
        );
        await _localDatasource.updateMinistry(
          ministry.copyWith(
            remoteId: Value(newMinistryRemoteId),
            isSynced: true,
            lastSyncedAt: Value(DateTime.now()),
          ),
        );
      }
    } catch (e) {
      _logger.warning('Failed to add ministry to remote: $e');
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
  Future<void> updateAgency(Agency agency) async {
    _ensureAdminPermission();
    await _localDatasource.updateAgency(agency);
    try {
      await _remoteDatasource.updateAgency(agency);
    } catch (_) {
      _logger.warning('Failed to update agency from remote');
    }
  }

  @override
  Future<void> updateMinistry(Ministry ministry) async {
    _ensureAdminPermission();
    await _localDatasource.updateMinistry(ministry);
    try {
      final agency = await _localDatasource.getAgencyById(ministry.agencyId);
      if (agency != null) {
        final ministryWithAgency = MinistryWithAgency(
          ministry: ministry,
          agency: agency,
        );
        await _remoteDatasource.updateMinistry(ministryWithAgency);
      }
    } catch (_) {
      _logger.warning('Failed to update ministry from remote');
    }
  }

  @override
  Stream<List<Agency>> watchAgencies({String? query}) {
    return _localDatasource.watchAgencies(query: query);
  }

  @override
  Stream<List<MinistryWithAgency>> watchMinistries({
    String? query,
    int? agencyId,
  }) {
    return _localDatasource.watchMinistries(query: query, agencyId: agencyId);
  }

  void _ensureAdminPermission() {
    final user = _userSession.currentUser;
    if (user == null || !user.role.isAnyAdmin) {
      throw Exception('Unauthorized access');
    }
  }
}

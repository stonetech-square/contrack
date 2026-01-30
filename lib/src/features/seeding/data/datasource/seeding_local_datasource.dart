import 'package:contrack/src/core/common/models/user_profile_model.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/seeding/data/models/seed_agency_model.dart';
import 'package:contrack/src/features/seeding/data/models/seed_ministry_model.dart';
import 'package:contrack/src/features/seeding/data/models/seed_project_model.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart' show LazySingleton;

abstract class SeedingLocalDataSource {
  Future<List<String>> getExistingUserIds();
  Future<List<String>> getExistingMinistryIds();
  Future<List<String>> getExistingAgencyIds();
  Future<List<String>> getExistingProjectIds();

  Stream<int> watchUsersCount();
  Stream<int> watchMinistriesCount();
  Stream<int> watchAgenciesCount();
  Stream<int> watchProjectsCount();

  Future<void> insertUsers(List<UserProfileModel> users);
  Future<void> insertMinistries(List<SeedMinistryModel> ministries);
  Future<void> insertAgencies(List<SeedAgencyModel> agencies);
  Future<void> insertProjects(List<SeedProjectModel> projects);
}

@LazySingleton(as: SeedingLocalDataSource)
class SeedingLocalDatasourceImpl implements SeedingLocalDataSource {
  final AppDatabase _appDatabase;
  SeedingLocalDatasourceImpl(this._appDatabase);

  @override
  Future<List<String>> getExistingAgencyIds() =>
      _getRemoteIds(_appDatabase.agencies, _appDatabase.agencies.remoteId);

  @override
  Future<List<String>> getExistingMinistryIds() =>
      _getRemoteIds(_appDatabase.ministries, _appDatabase.ministries.remoteId);

  @override
  Future<List<String>> getExistingProjectIds() =>
      _getRemoteIds(_appDatabase.projects, _appDatabase.projects.remoteId);

  @override
  Future<List<String>> getExistingUserIds() =>
      _getRemoteIds(_appDatabase.users, _appDatabase.users.remoteId);

  @override
  Future<void> insertAgencies(List<SeedAgencyModel> agencies) async {
    final ministries = await _appDatabase.select(_appDatabase.ministries).get();
    final ministryMap = {
      for (final m in ministries)
        if (m.remoteId != null) m.remoteId!: m.id,
    };

    await _appDatabase.batch((batch) {
      for (final agency in agencies) {
        final ministryId = ministryMap[agency.ministryId];
        if (ministryId != null) {
          final companion = AgenciesCompanion(
            remoteId: Value(agency.id),
            name: Value(agency.name),
            code: Value(agency.code),
            ministryId: Value(ministryId),
            isSynced: const Value(true),
            lastSyncedAt: Value(DateTime.now()),
            createdAt: Value(agency.createdAt),
            updatedAt: Value(agency.updatedAt),
          );
          batch.insert(
            _appDatabase.agencies,
            companion,
            onConflict: DoUpdate(
              (old) => companion,
              target: [_appDatabase.agencies.name],
            ),
          );
        }
      }
    });
  }

  @override
  Future<void> insertMinistries(List<SeedMinistryModel> ministries) async {
    await _appDatabase.batch((batch) {
      for (final ministry in ministries) {
        final companion = MinistriesCompanion(
          remoteId: Value(ministry.id),
          name: Value(ministry.name),
          code: Value(ministry.code),
          isActive: const Value(true),
          isSynced: const Value(true),
          lastSyncedAt: Value(DateTime.now()),
          createdAt: Value(ministry.createdAt),
          updatedAt: Value(ministry.updatedAt),
        );
        batch.insert(
          _appDatabase.ministries,
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_appDatabase.ministries.name],
          ),
        );
      }
    });
  }

  @override
  Future<void> insertProjects(List<SeedProjectModel> projects) async {
    final ministries = await _appDatabase.select(_appDatabase.ministries).get();
    final agencies = await _appDatabase.select(_appDatabase.agencies).get();
    final states = await _appDatabase.select(_appDatabase.states).get();
    final zones = await _appDatabase
        .select(_appDatabase.geopoliticalZones)
        .get();

    final ministryMap = {
      for (final m in ministries)
        if (m.remoteId != null) m.remoteId!: m.id,
    };
    final agencyMap = {
      for (final a in agencies)
        if (a.remoteId != null) a.remoteId!: a.id,
    };
    final stateMap = {
      for (final s in states)
        if (s.remoteId != null) s.remoteId!: s.id,
    };
    final zoneMap = {
      for (final z in zones)
        if (z.remoteId != null) z.remoteId!: z.id,
    };

    await _appDatabase.batch((batch) {
      for (final project in projects) {
        final ministryId = ministryMap[project.ministryId];
        final agencyId = agencyMap[project.agencyId];
        final stateId = stateMap[project.stateId];
        final zoneId = zoneMap[project.zoneId];

        if (ministryId != null &&
            agencyId != null &&
            stateId != null &&
            zoneId != null) {
          final companion = ProjectsCompanion(
            remoteId: Value(project.id),
            code: Value(project.code),
            title: Value(project.title),
            projectStatus: Value(project.projectStatus),
            inHouseStatus: Value(project.inHouseStatus),
            amount: Value(project.amount),
            constituency: Value(project.constituency),
            sponsor: Value(project.sponsor),
            createdBy: Value(project.createdBy),
            modifiedBy: Value(project.modifiedBy),
            startDate: Value(project.startDate),
            endDate: Value(project.endDate),
            createdAt: Value(project.createdAt),
            updatedAt: Value(project.updatedAt),
            ministryId: Value(ministryId),
            agencyId: Value(agencyId),
            stateId: Value(stateId),
            zoneId: Value(zoneId),
            isSynced: const Value(true),
            lastSyncedAt: Value(DateTime.now()),
          );
          batch.insert(
            _appDatabase.projects,
            companion,
            onConflict: DoUpdate(
              (old) => companion,
              target: [_appDatabase.projects.code],
            ),
          );
        }
      }
    });
  }

  @override
  Future<void> insertUsers(List<UserProfileModel> users) async {
    await _appDatabase.batch((batch) {
      for (final user in users) {
        final companion = UsersCompanion(
          uid: Value(user.id),
          remoteId: Value(user.id),
          username: Value(user.userName),
          fullName: Value(user.fullName),
          email: Value(user.email),
          role: Value(user.role),
          isActive: Value(user.isActive),
          createdAt: Value(user.createdAt),
          updatedAt: Value(user.updatedAt ?? DateTime.now()),
          lastLoginAt: Value(user.lastLoginAt),
          isSynced: const Value(true),
          lastSyncedAt: Value(DateTime.now()),
        );
        batch.insert(
          _appDatabase.users,
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_appDatabase.users.uid],
          ),
        );
      }
    });
  }

  @override
  Stream<int> watchAgenciesCount() => _watchCount(_appDatabase.agencies);

  @override
  Stream<int> watchMinistriesCount() => _watchCount(_appDatabase.ministries);

  @override
  Stream<int> watchProjectsCount() => _watchCount(_appDatabase.projects);

  @override
  Stream<int> watchUsersCount() => _watchCount(_appDatabase.users);

  Stream<int> _watchCount(TableInfo table) {
    var countExp = table.columnsByName.values.first.count();
    final query = _appDatabase.selectOnly(table)..addColumns([countExp]);
    return query.map((row) => row.read(countExp)!).watchSingle();
  }

  Future<List<String>> _getRemoteIds(
    TableInfo table,
    GeneratedColumn<String> remoteIdColumn,
  ) async {
    final query = _appDatabase.selectOnly(table)
      ..addColumns([remoteIdColumn])
      ..where(remoteIdColumn.isNotNull());

    return query.map((row) => row.read(remoteIdColumn)!).get();
  }
}

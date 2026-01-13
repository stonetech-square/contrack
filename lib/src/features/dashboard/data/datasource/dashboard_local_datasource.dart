import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/dashboard/data/models/models.dart';
import 'package:contrack/src/features/dashboard/data/models/project_with_details_model.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

abstract class DashboardLocalDataSource {
  Stream<List<ProjectModel>> watchRecentProjects({
    required int userId,
    required UserRole role,
    int limit,
  });

  Stream<List<ProjectWithDetailsModel>> watchRecentProjectsWithDetails({
    required int userId,
    required UserRole role,
    int limit,
  });

  Stream<int> watchUnsyncProjectCount(int userId, UserRole role);
  Stream<Map<ProjectStatus, int>> watchProjectCountsByStatus(
    int userId,
    UserRole role,
  );
}

@LazySingleton(as: DashboardLocalDataSource)
class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final AppDatabase database;

  DashboardLocalDataSourceImpl(this.database);

  Expression<bool> _buildRoleBasedPredicate(int userId, UserRole role) {
    if (role == UserRole.regular) {
      return database.projects.createdBy.equals(userId);
    }
    return const Constant(true);
  }

  @override
  Stream<List<ProjectModel>> watchRecentProjects({
    required int userId,
    required UserRole role,
    int limit = 15,
  }) {
    final query = database.select(database.projects)
      ..where((p) => _buildRoleBasedPredicate(userId, role))
      ..orderBy([
        (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
      ])
      ..limit(limit);

    return query.watch().map(
      (rows) => rows.map((row) => ProjectModel.fromDrift(row)).toList(),
    );
  }

  @override
  Stream<List<ProjectWithDetailsModel>> watchRecentProjectsWithDetails({
    required int userId,
    required UserRole role,
    int limit = 15,
  }) {
    final query =
        database.select(database.projects).join([
            leftOuterJoin(
              database.agencies,
              database.agencies.id.equalsExp(database.projects.agencyId),
            ),
            leftOuterJoin(
              database.states,
              database.states.id.equalsExp(database.projects.stateId),
            ),
          ])
          ..where(_buildRoleBasedPredicate(userId, role))
          ..orderBy([
            OrderingTerm(
              expression: database.projects.createdAt,
              mode: OrderingMode.desc,
            ),
          ])
          ..limit(limit);

    return query.watch().map((rows) {
      return rows.map((row) {
        final project = row.readTable(database.projects);
        final agency = row.readTableOrNull(database.agencies);
        final state = row.readTableOrNull(database.states);

        return ProjectWithDetailsModel(
          id: project.id,
          code: project.code,
          status: project.status,
          agencyId: project.agencyId,
          agencyName: agency?.name ?? 'Unknown Agency',
          ministryId: project.ministryId,
          stateId: project.stateId,
          stateName: state?.name ?? 'Unknown State',
          zoneId: project.zoneId,
          title: project.title,
          amount: project.amount,
          constituency: project.constituency,
          sponsor: project.sponsor,
          createdBy: project.createdBy,
          modifiedBy: project.modifiedBy,
          createdAt: project.createdAt,
          updatedAt: project.updatedAt,
          isSynced: project.isSynced,
          lastSyncedAt: project.lastSyncedAt,
          remoteId: project.remoteId,
        );
      }).toList();
    });
  }

  @override
  Stream<int> watchUnsyncProjectCount(int userId, UserRole role) {
    final unsyncedPredicate = database.projects.isSynced.equals(false);

    final predicate =
        unsyncedPredicate & _buildRoleBasedPredicate(userId, role);

    return (database.selectOnly(database.projects)
          ..addColumns([database.projects.id.count()])
          ..where(predicate))
        .map((row) => row.read(database.projects.id.count()) ?? 0)
        .watchSingle();
  }

  @override
  Stream<Map<ProjectStatus, int>> watchProjectCountsByStatus(
    int userId,
    UserRole role,
  ) {
    final query = database.selectOnly(database.projects)
      ..addColumns([database.projects.status, database.projects.id.count()])
      ..where(_buildRoleBasedPredicate(userId, role))
      ..groupBy([database.projects.status]);

    return query.watch().map((rows) {
      final counts = {for (final status in ProjectStatus.values) status: 0};

      for (final row in rows) {
        final statusName = row.read(database.projects.status);
        if (statusName != null) {
          final status = ProjectStatus.values.byName(statusName);
          counts[status] = row.read(database.projects.id.count()) ?? 0;
        }
      }

      return counts;
    });
  }
}

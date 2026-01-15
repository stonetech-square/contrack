import 'package:contrack/src/app/data/models/models.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/utils/project_code_generator.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

abstract class ProjectsLocalDataSource {
  String generateProjectCode(String userId, {DateTime? date});
  Future<void> createProject(ProjectModel project);
  Future<ProjectWithDetailsModel?> getProjectByCode(String code);
  Stream<List<ProjectModel>> watchProjectsForUser(
    int userId,
    UserRole role, {
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  });
  //
  List<ProjectStatus> getAllProjectStatus();
  Future<List<State>> getAllStatesByGeopoliticalZoneId(int geopoliticalZoneId);
  Future<List<GeopoliticalZone>> getAllGeopoliticalZones();
  Future<List<Agency>> getAllImplementingAgencies();
  Future<List<Ministry>> getAllSupervisingMinistriesByImplementingAgencyId(
    int implementingAgencyId,
  );
}

@LazySingleton(as: ProjectsLocalDataSource)
class ProjectsLocalDataSourceImpl implements ProjectsLocalDataSource {
  final AppDatabase _database;
  final ProjectCodeGenerator _projectCodeGenerator;
  ProjectsLocalDataSourceImpl(this._database, this._projectCodeGenerator);

  @override
  String generateProjectCode(String userId, {DateTime? date}) {
    final now = date ?? DateTime.now();
    return _projectCodeGenerator.generate(userId, now);
  }

  @override
  Future<void> createProject(ProjectModel project) async => await _database
      .into(_database.projects)
      .insert(project.toDriftCompanion());

  @override
  List<ProjectStatus> getAllProjectStatus() => ProjectStatus.values.toList();

  @override
  Future<List<GeopoliticalZone>> getAllGeopoliticalZones() async =>
      await _database.select(_database.geopoliticalZones).get();

  @override
  Future<List<Agency>> getAllImplementingAgencies() async =>
      await _database.select(_database.agencies).get();

  @override
  Future<List<State>> getAllStatesByGeopoliticalZoneId(
    int geopoliticalZoneId,
  ) async {
    final query = _database.select(_database.states)
      ..where((t) => t.zoneId.equals(geopoliticalZoneId));
    return await query.get();
  }

  @override
  Future<List<Ministry>> getAllSupervisingMinistriesByImplementingAgencyId(
    int implementingAgencyId,
  ) async {
    final query = _database.select(_database.ministries)
      ..where((t) => t.agencyId.equals(implementingAgencyId));
    return await query.get();
  }

  @override
  Future<ProjectWithDetailsModel?> getProjectByCode(String code) async {
    final query =
        _database.select(_database.projects).join([
            leftOuterJoin(
              _database.agencies,
              _database.agencies.id.equalsExp(_database.projects.agencyId),
            ),
            leftOuterJoin(
              _database.states,
              _database.states.id.equalsExp(_database.projects.stateId),
            ),
          ])
          ..where(_database.projects.code.equals(code))
          ..orderBy([
            OrderingTerm(
              expression: _database.projects.createdAt,
              mode: OrderingMode.desc,
            ),
          ])
          ..limit(1);

    final result = await query.getSingleOrNull();
    if (result == null) return null;

    final project = result.readTable(_database.projects);
    final agency = result.readTableOrNull(_database.agencies);
    final state = result.readTableOrNull(_database.states);

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
  }

  @override
  Stream<List<ProjectModel>> watchProjectsForUser(
    int userId,
    UserRole role, {
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  }) {
    final normalizedQuery = query?.trim().toLowerCase() ?? '';

    final baseQuery = _database.select(_database.projects).join([
      leftOuterJoin(
        _database.agencies,
        _database.agencies.id.equalsExp(_database.projects.agencyId),
      ),
      leftOuterJoin(
        _database.ministries,
        _database.ministries.id.equalsExp(_database.projects.ministryId),
      ),
      leftOuterJoin(
        _database.states,
        _database.states.id.equalsExp(_database.projects.stateId),
      ),
    ]);

    if (role == UserRole.regular) {
      baseQuery.where(_database.projects.createdBy.equals(userId));
    }

    if (normalizedQuery.isNotEmpty) {
      baseQuery.where(
        _database.projects.code.lower().contains(normalizedQuery) |
            _database.projects.title.lower().contains(normalizedQuery) |
            _database.projects.constituency.lower().contains(normalizedQuery) |
            _database.projects.sponsor.lower().contains(normalizedQuery) |
            _database.agencies.name.lower().contains(normalizedQuery) |
            _database.ministries.name.lower().contains(normalizedQuery) |
            _database.states.name.lower().contains(normalizedQuery),
      );
    }

    if (filter.agencyId != null) {
      baseQuery.where(_database.projects.agencyId.equals(filter.agencyId!));
    }
    if (filter.ministryId != null) {
      baseQuery.where(_database.projects.ministryId.equals(filter.ministryId!));
    }
    if (filter.stateId != null) {
      baseQuery.where(_database.projects.stateId.equals(filter.stateId!));
    }
    if (filter.isSynced != null) {
      if (filter.isSynced!) {
        baseQuery.where(
          _database.projects.lastSyncedAt.isNotNull() &
              _database.projects.remoteId.isNotNull() &
              _database.projects.remoteId.isNotValue(''),
        );
      } else {
        baseQuery.where(
          _database.projects.lastSyncedAt.isNull() |
              _database.projects.remoteId.isNull() |
              _database.projects.remoteId.equals(''),
        );
      }
    }
    if (filter.startDate != null) {
      baseQuery.where(
        _database.projects.startDate.isBiggerOrEqualValue(filter.startDate!),
      );
    }
    if (filter.endDate != null) {
      baseQuery.where(
        _database.projects.endDate.isSmallerOrEqualValue(filter.endDate!),
      );
    }

    final sortMode = filter.sortOrder == SortOrder.asc
        ? OrderingMode.asc
        : OrderingMode.desc;

    Expression<Object> sortExpression;
    switch (filter.sortField) {
      case ProjectSortField.createdAt:
        sortExpression = _database.projects.createdAt;
        break;
      case ProjectSortField.updatedAt:
        sortExpression = _database.projects.updatedAt;
        break;
      case ProjectSortField.title:
        sortExpression = _database.projects.title;
        break;
      case ProjectSortField.budget:
        sortExpression = _database.projects.amount;
        break;
      case ProjectSortField.startDate:
        sortExpression = _database.projects.startDate;
        break;
      case ProjectSortField.endDate:
        sortExpression = _database.projects.endDate;
        break;
    }

    baseQuery.orderBy([
      OrderingTerm(expression: sortExpression, mode: sortMode),
    ]);

    if (filter.limit != null) {
      baseQuery.limit(filter.limit!, offset: filter.offset);
    }

    return baseQuery.watch().map(
      (results) => results
          .map(
            (row) => ProjectModel.fromDrift(row.readTable(_database.projects)),
          )
          .toList(),
    );
  }
}

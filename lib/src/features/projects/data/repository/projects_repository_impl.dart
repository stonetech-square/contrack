import 'package:contrack/src/app/data/models/models.dart';
import 'package:contrack/src/core/audit/audit_service.dart';
import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/data/datasource/projects_local_datasource.dart';
import 'package:contrack/src/features/projects/domain/entities/geopolitical_zone.dart'
    as domain;
import 'package:contrack/src/features/projects/domain/entities/implementing_agency.dart';
import 'package:contrack/src/features/projects/domain/entities/nigerian_state.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:contrack/src/features/projects/domain/entities/supervising_ministry.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:contrack/src/core/services/project_export_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProjectsRepository)
class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsLocalDataSource _localDataSource;
  final UserSession _userSession;
  final ProjectExportService _exportService;
  final AuditService _auditService;

  ProjectsRepositoryImpl(
    this._localDataSource,
    this._userSession,
    this._exportService,
    this._auditService,
  );

  @override
  String generateProjectCode({DateTime? date}) {
    final user = _userSession.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    return _localDataSource.generateProjectCode(user.uid, date: date);
  }

  @override
  Future<void> createProject(List<Project> projects) async {
    final user = _userSession.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    final projectsWithCreatedBy = projects
        .map((project) => project.copyWith(createdBy: user.id))
        .toList();

    final projectModels = projectsWithCreatedBy
        .map((project) => ProjectModel.fromEntity(project))
        .toList();
    await _localDataSource.createProject(projectModels);
  }

  @override
  Future<List<domain.GeopoliticalZone>> getGeopoliticalZones() async {
    final zones = await _localDataSource.getAllGeopoliticalZones();
    return zones
        .map((e) => domain.GeopoliticalZone(id: e.id, name: e.name))
        .toList();
  }

  @override
  Future<List<ImplementingAgency>> getImplementingAgencies() async {
    final agencies = await _localDataSource.getAllImplementingAgencies();
    return agencies
        .map((e) => ImplementingAgency(id: e.id, name: e.name))
        .toList();
  }

  @override
  Future<List<NigerianState>> getStates(int zoneId) async {
    final states = await _localDataSource.getAllStatesByGeopoliticalZoneId(
      zoneId,
    );
    return states
        .map((e) => NigerianState(id: e.id, name: e.name, zoneId: zoneId))
        .toList();
  }

  @override
  Future<List<SupervisingMinistry>> getSupervisingMinistries(
    int agencyId,
  ) async {
    final ministries = await _localDataSource
        .getAllSupervisingMinistriesByImplementingAgencyId(agencyId);
    return ministries
        .map(
          (e) =>
              SupervisingMinistry(id: e.id, name: e.name, agencyId: agencyId),
        )
        .toList();
  }

  @override
  Future<ProjectWithDetails?> getProjectByCode(String code) async {
    final projectModel = await _localDataSource.getProjectByCode(code);
    return projectModel?.toEntity();
  }

  @override
  Stream<List<Project>> watchProjectsForUser({
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  }) {
    final user = _userSession.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    return _localDataSource
        .watchProjectsForUser(user.id, user.role, query: query, filter: filter)
        .map((models) => models.map((model) => model.toEntity()).toList());
  }

  @override
  Future<String> exportProject({
    required ProjectWithDetails project,
    required ExportFormat format,
  }) async {
    final user = _userSession.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    final filePath = await _exportService.exportProject(project, format);
    final fileName = filePath.split('/').last;

    await _localDataSource.recordExport(
      userId: user.id,
      projectCode: project.code,
      format: format,
      fileName: fileName,
      recordCount: 1,
    );

    await _auditService.logExport(
      userId: user.id,
      projectCode: project.code,
      fileName: fileName,
    );

    return filePath;
  }

  @override
  Future<String> exportAllProjects({
    required ExportFormat format,
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  }) async {
    final user = _userSession.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    final projects = await _localDataSource.getAllProjectsWithDetails(
      user.id,
      user.role,
      query: query,
      filter: filter,
    );

    if (projects.isEmpty) {
      throw Exception('No projects to export');
    }

    final filePath = await _exportService.exportProjects(
      projects.map((model) => model.toEntity()).toList(),
      format,
    );
    final fileName = filePath.split('/').last;

    for (final project in projects) {
      await _localDataSource.recordExport(
        userId: user.id,
        projectCode: project.code,
        format: format,
        fileName: fileName,
        recordCount: projects.length,
      );

      await _auditService.logExport(
        userId: user.id,
        projectCode: project.code,
        fileName: fileName,
      );
    }

    return filePath;
  }
}

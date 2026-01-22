import 'package:contrack/src/app/data/models/models.dart';
import 'package:contrack/src/core/audit/audit_service.dart';
import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/core/services/project_export_service.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/data/datasource/projects_local_datasource.dart';
import 'package:contrack/src/features/projects/domain/entities/export_type.dart';
import 'package:contrack/src/features/projects/domain/entities/geopolitical_zone.dart'
    as domain;
import 'package:contrack/src/features/projects/domain/entities/implementing_agency.dart';
import 'package:contrack/src/features/projects/domain/entities/nigerian_state.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:contrack/src/features/projects/domain/entities/supervising_ministry.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@LazySingleton(as: ProjectsRepository)
class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsLocalDataSource _localDataSource;
  final UserSession _userSession;
  final ProjectExportService _exportService;
  final AuditService _auditService;
  final Logger _logger = Logger('ProjectsRepositoryImpl');

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
      _logger.warning('User not logged in');
      return '';
    }
    return _localDataSource.generateProjectCode(user.uid, date: date);
  }

  @override
  Future<void> createProject(List<Project> projects) async {
    final user = _userSession.currentUser;
    if (user == null) {
      _logger.warning('User not logged in');
      return;
    }
    final projectsToSave = projects
        .map(
          (project) => project.copyWith(
            createdBy: project.createdBy.isEmpty ? user.uid : project.createdBy,
            modifiedBy: user.uid,
            updatedAt: DateTime.now(),
          ),
        )
        .toList();

    final projectModels = projectsToSave
        .map((project) => ProjectModel.fromEntity(project))
        .toList();
    await _localDataSource.createProject(projectModels);
  }

  @override
  Future<void> deleteProject(String code) async {
    final user = _userSession.currentUser;
    if (user == null) {
      _logger.warning('User not logged in');
      return;
    }
    await _localDataSource.deleteProject(code);
  }

  @override
  Future<List<domain.GeopoliticalZone>> getGeopoliticalZones() async {
    final zones = await _localDataSource.getAllGeopoliticalZones();
    return zones
        .map((e) => domain.GeopoliticalZone(id: e.id, name: e.name))
        .toList();
  }

  @override
  Future<List<SupervisingMinistry>> getSupervisingMinistries() async {
    final ministries = await _localDataSource.getAllSupervisingMinistries();
    return ministries
        .map((e) => SupervisingMinistry(id: e.id, name: e.name))
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
  Future<List<ImplementingAgency>> getImplementingAgencies(
    int ministryId,
  ) async {
    final agencies = await _localDataSource
        .getAllImplementingAgenciesBySupervisingMinistryId(ministryId);
    return agencies
        .map(
          (e) => ImplementingAgency(
            id: e.id,
            name: e.name,
            ministryId: ministryId,
          ),
        )
        .toList();
  }

  @override
  Stream<ProjectWithDetails?> watchProjectByCode(String code) {
    return _localDataSource.watchProjectByCode(code).map((model) {
      return model?.toEntity();
    });
  }

  @override
  Stream<List<ProjectWithDetails>> watchProjectsForUser({
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  }) {
    final user = _userSession.currentUser;
    if (user == null) {
      _logger.warning('User not logged in');
      return Stream.empty();
    }

    return _localDataSource
        .watchProjectsForUser(user.uid, user.role, query: query, filter: filter)
        .map((models) => models.map((model) => model.toEntity()).toList());
  }

  @override
  Future<String> exportProject({
    required ProjectWithDetails project,
    required ExportFormat format,
    ExportType type = ExportType.preferred,
  }) async {
    final user = _userSession.currentUser;
    if (user == null) {
      _logger.warning('User not logged in');
      return '';
    }

    final filePath = await _exportService.exportProject(
      project,
      format,
      type: type,
    );
    final fileName = filePath.split('/').last;

    await _localDataSource.recordExport(
      userId: user.uid,
      projectCode: project.code,
      format: format,
      fileName: fileName,
      recordCount: 1,
    );

    await _auditService.logExport(
      userId: user.uid,
      projectCode: project.code,
      fileName: fileName,
    );

    return filePath;
  }

  @override
  Future<String> exportAllProjects({
    required ExportFormat format,
    ExportType type = ExportType.preferred,
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  }) async {
    final user = _userSession.currentUser;
    if (user == null) {
      _logger.warning('User not logged in');
      return '';
    }

    final projects = await _localDataSource.getAllProjectsWithDetails(
      user.uid,
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
      type: type,
    );
    final fileName = filePath.split('/').last;

    for (final project in projects) {
      await _localDataSource.recordExport(
        userId: user.uid,
        projectCode: project.code,
        format: format,
        fileName: fileName,
        recordCount: projects.length,
      );

      await _auditService.logExport(
        userId: user.uid,
        projectCode: project.code,
        fileName: fileName,
      );
    }

    return filePath;
  }
}

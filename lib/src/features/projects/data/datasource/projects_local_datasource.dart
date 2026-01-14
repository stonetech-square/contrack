import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/utils/project_code_generator.dart';
import 'package:contrack/src/app/data/models/models.dart';
import 'package:injectable/injectable.dart';

abstract class ProjectsLocalDataSource {
  String generateProjectCode(String userId, {DateTime? date});
  Future<void> createProject(ProjectModel project);
  List<ProjectStatus> getAllProjectStatus();
  //
  Future<List> getAllStatesByGeopoliticalZoneId(int geopoliticalZoneId);
  Future<List> getAllGeopoliticalZones();
  Future<List> getAllImplementingAgencies();
  Future<List> getAllSupervisingMinistriesByImplementingAgencyId(
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
  Future<List> getAllGeopoliticalZones() async =>
      await _database.select(_database.geopoliticalZones).get();

  @override
  Future<List> getAllImplementingAgencies() async =>
      await _database.select(_database.agencies).get();

  @override
  Future<List> getAllStatesByGeopoliticalZoneId(int geopoliticalZoneId) async {
    final query = _database.select(_database.states)
      ..where((t) => t.zoneId.equals(geopoliticalZoneId));
    return await query.get();
  }

  @override
  Future<List> getAllSupervisingMinistriesByImplementingAgencyId(
    int implementingAgencyId,
  ) async {
    final query = _database.select(_database.ministries)
      ..where((t) => t.agencyId.equals(implementingAgencyId));
    return await query.get();
  }
}

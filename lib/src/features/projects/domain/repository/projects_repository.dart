import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/domain/entities/geopolitical_zone.dart';
import 'package:contrack/src/features/projects/domain/entities/implementing_agency.dart';
import 'package:contrack/src/features/projects/domain/entities/nigerian_state.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:contrack/src/features/projects/domain/entities/supervising_ministry.dart';

import 'package:contrack/src/features/projects/domain/entities/export_type.dart';

abstract class ProjectsRepository {
  String generateProjectCode({DateTime? date});
  Future<void> createProject(List<Project> projects);
  Future<void> deleteProject(String code);

  Future<List<GeopoliticalZone>> getGeopoliticalZones();
  Future<List<NigerianState>> getStates(int zoneId);
  Future<List<SupervisingMinistry>> getSupervisingMinistries();
  Future<List<ImplementingAgency>> getImplementingAgencies(int ministryId);
  Stream<ProjectWithDetails?> watchProjectByCode(String code);
  Stream<List<ProjectWithDetails>> watchProjectsForUser({
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  });

  Future<String> exportProject({
    required ProjectWithDetails project,
    required ExportFormat format,
    ExportType type = ExportType.preferred,
  });

  Future<String> exportAllProjects({
    required ExportFormat format,
    ExportType type = ExportType.preferred,
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  });
}

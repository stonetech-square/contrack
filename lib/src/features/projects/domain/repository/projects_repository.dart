import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/domain/entities/geopolitical_zone.dart';
import 'package:contrack/src/features/projects/domain/entities/implementing_agency.dart';
import 'package:contrack/src/features/projects/domain/entities/nigerian_state.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:contrack/src/features/projects/domain/entities/supervising_ministry.dart';

abstract class ProjectsRepository {
  String generateProjectCode({DateTime? date});
  Future<void> createProject({
    required String code,
    required ProjectStatus status,
    required int agencyId,
    required int ministryId,
    required int stateId,
    required int zoneId,
    required String constituency,
    required String title,
    required double amount,
    String? sponsor,
    required DateTime startDate,
    required DateTime endDate,
  });

  Future<List<GeopoliticalZone>> getGeopoliticalZones();
  Future<List<NigerianState>> getStates(int zoneId);
  Future<List<ImplementingAgency>> getImplementingAgencies();
  Future<List<SupervisingMinistry>> getSupervisingMinistries(int agencyId);
  Future<ProjectWithDetails?> getProjectByCode(String code);
  Stream<List<Project>> watchProjectsForUser({
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  });

  Future<String> exportProject({
    required ProjectWithDetails project,
    required ExportFormat format,
  });

  Future<String> exportAllProjects({
    required ExportFormat format,
    String? query,
    ProjectFilter filter = const ProjectFilter(),
  });
}

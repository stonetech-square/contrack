import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';

import 'package:contrack/src/features/projects/domain/entities/export_type.dart';

abstract class ProjectExportService {
  Future<String> exportProject(
    ProjectWithDetails project,
    ExportFormat format, {
    ExportType type = ExportType.preferred,
  });
  Future<String> exportProjects(
    List<ProjectWithDetails> projects,
    ExportFormat format, {
    ExportType type = ExportType.preferred,
  });
}

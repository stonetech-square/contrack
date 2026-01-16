import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';

abstract class ProjectExportService {
  Future<String> exportProject(
    ProjectWithDetails project,
    ExportFormat format,
  );
  Future<String> exportProjects(
    List<ProjectWithDetails> projects,
    ExportFormat format,
  );
}

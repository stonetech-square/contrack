import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ExportProjectUseCase implements UseCase<Future<String>, ExportProjectParams> {
  final ProjectsRepository _projectsRepository;

  ExportProjectUseCase(this._projectsRepository);

  @override
  Future<String> call(ExportProjectParams params) async {
    return await _projectsRepository.exportProject(
      project: params.project,
      format: params.format,
    );
  }
}

class ExportProjectParams extends Equatable {
  final ProjectWithDetails project;
  final ExportFormat format;

  const ExportProjectParams({required this.project, required this.format});

  @override
  List<Object?> get props => [project, format];
}

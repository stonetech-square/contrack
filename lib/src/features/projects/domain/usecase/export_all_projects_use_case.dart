import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ExportAllProjectsUseCase
    implements UseCase<Future<String>, ExportAllProjectsParams> {
  final ProjectsRepository _projectsRepository;

  ExportAllProjectsUseCase(this._projectsRepository);

  @override
  Future<String> call(ExportAllProjectsParams params) async {
    return await _projectsRepository.exportAllProjects(
      format: params.format,
      query: params.query,
      filter: params.filter,
    );
  }
}

class ExportAllProjectsParams extends Equatable {
  final ExportFormat format;
  final String? query;
  final ProjectFilter filter;

  const ExportAllProjectsParams({
    required this.format,
    this.query,
    this.filter = const ProjectFilter(),
  });

  @override
  List<Object?> get props => [format, query, filter];
}

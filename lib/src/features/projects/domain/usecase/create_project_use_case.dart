import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateProjectUseCase implements UseCase<void, CreateProjectParams> {
  final ProjectsRepository _repository;

  CreateProjectUseCase(this._repository);

  @override
  Future<void> call(CreateProjectParams params) async {
    await _repository.createProject(params.projects);
  }
}

class CreateProjectParams extends Equatable {
  final List<Project> projects;
  const CreateProjectParams({required this.projects});
  @override
  List<Object?> get props => [projects];
}

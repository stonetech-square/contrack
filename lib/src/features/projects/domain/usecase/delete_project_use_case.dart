import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteProjectUseCase implements UseCase<void, DeleteProjectParams> {
  final ProjectsRepository _repository;

  DeleteProjectUseCase(this._repository);

  @override
  Future<void> call(DeleteProjectParams params) {
    return _repository.deleteProject(params.code);
  }
}

class DeleteProjectParams extends Equatable {
  final String code;

  const DeleteProjectParams({required this.code});

  @override
  List<Object?> get props => [code];
}

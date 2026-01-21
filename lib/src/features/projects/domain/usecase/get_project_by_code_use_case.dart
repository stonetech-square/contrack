import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProjectByCodeUseCase
    implements UseCase<Stream<ProjectWithDetails?>, GetProjectByCodeParams> {
  final ProjectsRepository _repository;

  GetProjectByCodeUseCase(this._repository);

  @override
  Stream<ProjectWithDetails?> call(GetProjectByCodeParams params) {
    return _repository.watchProjectByCode(params.code);
  }
}

class GetProjectByCodeParams extends Equatable {
  final String code;

  const GetProjectByCodeParams({required this.code});

  @override
  List<Object?> get props => [code];
}

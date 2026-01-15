import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProjectByCodeUseCase
    implements UseCase<Future<ProjectWithDetails?>, GetProjectByCodeParams> {
  final ProjectsRepository _repository;

  GetProjectByCodeUseCase(this._repository);

  @override
  Future<ProjectWithDetails?> call(GetProjectByCodeParams params) async {
    return await _repository.getProjectByCode(params.code);
  }
}

class GetProjectByCodeParams extends Equatable {
  final String code;

  const GetProjectByCodeParams({required this.code});

  @override
  List<Object?> get props => [code];
}

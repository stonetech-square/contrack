import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchProjectsForUserUseCase
    implements
        UseCase<Stream<List<ProjectWithDetails>>, WatchProjectsForUserParams> {
  final ProjectsRepository _repository;

  WatchProjectsForUserUseCase(this._repository);

  @override
  Stream<List<ProjectWithDetails>> call(WatchProjectsForUserParams params) {
    return _repository.watchProjectsForUser(
      query: params.query,
      filter: params.filter,
    );
  }
}

class WatchProjectsForUserParams extends Equatable {
  final String? query;
  final ProjectFilter filter;

  const WatchProjectsForUserParams({
    this.query,
    this.filter = const ProjectFilter(),
  });

  @override
  List<Object?> get props => [query, filter];
}

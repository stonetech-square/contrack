import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchRecentProjectsUseCase
    implements UseCase<Stream<List<Project>>, NoParams> {
  final DashboardRepository _repository;

  WatchRecentProjectsUseCase(this._repository);

  @override
  Stream<List<Project>> call(NoParams params) {
    return _repository.watchRecentProjects();
  }
}

@lazySingleton
class WatchRecentProjectsWithDetailsUseCase
    implements UseCase<Stream<List<ProjectWithDetails>>, NoParams> {
  final DashboardRepository _repository;

  WatchRecentProjectsWithDetailsUseCase(this._repository);

  @override
  Stream<List<ProjectWithDetails>> call(NoParams params) {
    return _repository.watchRecentProjectsWithDetails();
  }
}

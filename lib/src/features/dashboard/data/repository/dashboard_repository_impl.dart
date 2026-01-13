import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/features/dashboard/data/datasource/dashboard_local_datasource.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource _localDataSource;
  final UserSession _userSession;
  final Logger _logger = Logger('DashboardRepositoryImpl');

  DashboardRepositoryImpl(this._localDataSource, this._userSession);

  @override
  Stream<List<Project>> watchRecentProjects() {
    return _userSession.userStream.switchMap((user) {
      if (user == null) {
        throw AppFailure('User not logged in');
      }

      return _localDataSource
          .watchRecentProjects(userId: user.id, role: user.role)
          .map((models) => models.map((e) => e.toEntity()).toList())
          .handleError((error, stackTrace) {
            _logger.severe(
              'Error watching projects for user: ${user.id}',
              error,
              stackTrace,
            );
            throw AppFailure.fromException(error, stackTrace);
          });
    });
  }

  @override
  Stream<List<ProjectWithDetails>> watchRecentProjectsWithDetails() {
    return _userSession.userStream.switchMap((user) {
      if (user == null) {
        throw AppFailure('User not logged in');
      }

      return _localDataSource
          .watchRecentProjectsWithDetails(userId: user.id, role: user.role)
          .map((models) => models.map((e) => e.toEntity()).toList())
          .handleError((error, stackTrace) {
            _logger.severe(
              'Error watching projects with details for user: ${user.id}',
              error,
              stackTrace,
            );
            throw AppFailure.fromException(error, stackTrace);
          });
    });
  }

  @override
  Stream<int> watchUnsyncedProjectCount() {
    return _userSession.userStream.switchMap((user) {
      if (user == null) {
        throw AppFailure('User not logged in');
      }
      return _localDataSource
          .watchUnsyncProjectCount(user.id, user.role)
          .handleError((error, stackTrace) {
            _logger.severe(
              'Error watching unsynced project count for user: ${user.id}',
              error,
              stackTrace,
            );
            throw AppFailure.fromException(error, stackTrace);
          });
    });
  }

  @override
  Stream<Map<ProjectStatus, int>> watchProjectCountsByStatus() {
    return _userSession.userStream.switchMap((user) {
      if (user == null) {
        throw AppFailure('User not logged in');
      }
      return _localDataSource
          .watchProjectCountsByStatus(user.id, user.role)
          .handleError((error, stackTrace) {
            _logger.severe(
              'Error watching project counts by status for user: ${user.id}',
              error,
              stackTrace,
            );
            throw AppFailure.fromException(error, stackTrace);
          });
    });
  }

  @override
  Future<void> forceSyncProjects() {
    // TODO: implement forceSyncProjects
    throw UnimplementedError();
  }
}

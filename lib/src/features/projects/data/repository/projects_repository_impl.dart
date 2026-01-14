import 'package:contrack/src/app/data/models/models.dart';

import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/projects/data/datasource/projects_local_datasource.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';

import 'package:contrack/src/core/session/user_session.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProjectsRepository)
class ProjectsRepositoryImpl implements ProjectsRepository {
  final ProjectsLocalDataSource _localDataSource;
  final UserSession _userSession;

  ProjectsRepositoryImpl(this._localDataSource, this._userSession);

  @override
  String generateProjectCode({DateTime? date}) {
    final user = _userSession.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }
    return _localDataSource.generateProjectCode(user.uid, date: date);
  }

  @override
  Future<void> createProject({
    required String code,
    required ProjectStatus status,
    required int agencyId,
    required int ministryId,
    required int stateId,
    required int zoneId,
    required String constituency,
    required String title,
    required double amount,
    String? sponsor,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final user = _userSession.currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    final projectModel = ProjectModel(
      id: 0, // Auto-increment handled by Drift
      code: code,
      status: status,
      agencyId: agencyId,
      ministryId: ministryId,
      stateId: stateId,
      zoneId: zoneId,
      constituency: constituency,
      title: title,
      amount: amount,
      sponsor: sponsor,
      createdBy: user.id,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    await _localDataSource.createProject(projectModel);
  }
}

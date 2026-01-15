import 'package:contrack/src/app/data/models/models.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';

import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/data/datasource/projects_local_datasource.dart';
import 'package:contrack/src/features/projects/domain/entities/geopolitical_zone.dart'
    as domain;
import 'package:contrack/src/features/projects/domain/entities/implementing_agency.dart';
import 'package:contrack/src/features/projects/domain/entities/nigerian_state.dart';
import 'package:contrack/src/features/projects/domain/entities/supervising_ministry.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
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

  @override
  Future<List<domain.GeopoliticalZone>> getGeopoliticalZones() async {
    final zones = await _localDataSource.getAllGeopoliticalZones();
    return zones
        .map((e) => domain.GeopoliticalZone(id: e.id, name: e.name))
        .toList();
  }

  @override
  Future<List<ImplementingAgency>> getImplementingAgencies() async {
    final agencies = await _localDataSource.getAllImplementingAgencies();
    return agencies
        .map((e) => ImplementingAgency(id: e.id, name: e.name))
        .toList();
  }

  @override
  Future<List<NigerianState>> getStates(int zoneId) async {
    final states = await _localDataSource.getAllStatesByGeopoliticalZoneId(
      zoneId,
    );
    return states
        .map((e) => NigerianState(id: e.id, name: e.name, zoneId: e.zoneId))
        .toList();
  }

  @override
  Future<List<SupervisingMinistry>> getSupervisingMinistries(
    int agencyId,
  ) async {
    final ministries = await _localDataSource
        .getAllSupervisingMinistriesByImplementingAgencyId(agencyId);
    return ministries
        .map(
          (e) =>
              SupervisingMinistry(id: e.id, name: e.name, agencyId: e.agencyId),
        )
        .toList();
  }

  @override
  Future<ProjectWithDetails?> getProjectByCode(String code) async {
    final projectModel = await _localDataSource.getProjectByCode(code);
    return projectModel?.toEntity();
  }
}

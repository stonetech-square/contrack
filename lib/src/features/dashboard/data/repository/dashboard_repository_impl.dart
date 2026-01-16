import 'dart:io';

import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/services/project_import_service.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/features/dashboard/data/datasource/dashboard_local_datasource.dart';
import 'package:contrack/src/features/dashboard/domain/entities/import_result.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource _localDataSource;
  final UserSession _userSession;
  final ProjectsRepository _projectsRepository;
  final ProjectImportService _importService;
  final Logger _logger = Logger('DashboardRepositoryImpl');

  DashboardRepositoryImpl(
    this._localDataSource,
    this._userSession,
    this._projectsRepository,
    this._importService,
  );

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
  Future<ImportResult> importProjects(File file) async {
    final dtos = await _importService.importProjectsDto(file);
    int success = 0;
    int failure = 0;
    final errors = <String>[];

    final zoneCache = <String, int>{};
    final agencyCache = <String, int>{};
    final stateCache = <int, Map<String, int>>{};
    final ministryCache = <int, Map<String, int>>{};

    try {
      final zones = await _projectsRepository.getGeopoliticalZones();
      for (final z in zones) {
        zoneCache[z.name.toLowerCase()] = z.id;
      }
      final agencies = await _projectsRepository.getImplementingAgencies();
      for (final a in agencies) {
        agencyCache[a.name.toLowerCase()] = a.id;
      }
    } catch (e) {
      return ImportResult(
        successCount: 0,
        failureCount: dtos.length,
        errors: ['Failed to load metadata: $e'],
      );
    }

    for (final dto in dtos) {
      try {
        final zoneId = zoneCache[dto.zone.toLowerCase()];
        if (zoneId == null) throw Exception('Zone not found: ${dto.zone}');

        if (!stateCache.containsKey(zoneId)) {
          final states = await _projectsRepository.getStates(zoneId);
          stateCache[zoneId] = {
            for (var s in states) s.name.toLowerCase(): s.id,
          };
        }
        final stateId = stateCache[zoneId]![dto.state.toLowerCase()];
        if (stateId == null) {
          throw Exception('State not found: ${dto.state} in zone ${dto.zone}');
        }

        final agencyId = agencyCache[dto.agency.toLowerCase()];
        if (agencyId == null) {
          throw Exception('Agency not found: ${dto.agency}');
        }

        if (!ministryCache.containsKey(agencyId)) {
          final ministries = await _projectsRepository.getSupervisingMinistries(
            agencyId,
          );
          ministryCache[agencyId] = {
            for (var m in ministries) m.name.toLowerCase(): m.id,
          };
        }
        final ministryId = ministryCache[agencyId]![dto.ministry.toLowerCase()];
        if (ministryId == null) {
          throw Exception(
            'Ministry not found: ${dto.ministry} for agency ${dto.agency}',
          );
        }

        final status = ProjectStatus.values.firstWhere(
          (e) => e.displayName.toLowerCase() == dto.status.toLowerCase(),
          orElse: () => ProjectStatus.notStarted,
        );

        await _projectsRepository.createProject(
          code: dto.code,
          status: status,
          agencyId: agencyId,
          ministryId: ministryId,
          stateId: stateId,
          zoneId: zoneId,
          constituency: dto.constituency,
          title: dto.title,
          amount: dto.amount,
          sponsor: dto.sponsor,
          startDate: DateTime.now(),
          endDate: DateTime.now().add(const Duration(days: 365)),
        );

        success++;
      } catch (e) {
        failure++;
        errors.add('Error importing ${dto.code}: $e');
      }
    }

    return ImportResult(
      successCount: success,
      failureCount: failure,
      errors: errors,
    );
  }
}

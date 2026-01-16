import 'dart:io';

import 'package:contrack/src/app/data/models/models.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/services/project_import_service.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/core/utils/project_code_generator.dart';
import 'package:contrack/src/features/dashboard/data/datasource/dashboard_local_datasource.dart';

import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource _localDataSource;
  final UserSession _userSession;
  final ProjectImportService _importService;
  final ProjectCodeGenerator _codeGenerator;
  final Logger _logger = Logger('DashboardRepositoryImpl');

  DashboardRepositoryImpl(
    this._localDataSource,
    this._userSession,
    this._importService,
    this._codeGenerator,
  );

  static final _codePattern = RegExp(r'^ERGP-39-\d{4}-\d{4}-\d{3}$');

  bool _isValidProjectCode(String code) => _codePattern.hasMatch(code);

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
  Future<List<Project>> importProjects(File file) async {
    final user = _userSession.currentUser;
    if (user == null) throw AppFailure('User not logged in');
    final userFromDb = await _localDataSource.getUserById(user.id);
    if (userFromDb == null) {
      throw AppFailure('User not found locally. Please re-login.');
    }

    final dtos = await _importService.importProjectsDto(file);
    final successfulProjects = <Project>[];

    final zoneCache = <String, int>{};
    final agencyCache = <String, int>{};
    final stateCache = <int, Map<String, int>>{};
    final ministryCache = <int, Map<String, int>>{};

    try {
      final zones = await _localDataSource.getAllGeopoliticalZones();
      for (final z in zones) {
        zoneCache[z.name.toLowerCase()] = z.id;
      }
      final agencies = await _localDataSource.getAllImplementingAgencies();
      for (final a in agencies) {
        agencyCache[a.name.toLowerCase()] = a.id;
      }
    } catch (e) {
      _logger.severe('Failed to load metadata: $e');
      return [];
    }

    for (final dto in dtos) {
      try {
        final zoneId = zoneCache[dto.zone.toLowerCase()];
        if (zoneId == null) throw Exception('Zone not found: ${dto.zone}');

        if (!stateCache.containsKey(zoneId)) {
          final states = await _localDataSource.getStatesByZoneId(zoneId);
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
          final ministries = await _localDataSource.getMinistriesByAgencyId(
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

        final code = _isValidProjectCode(dto.code)
            ? dto.code
            : _codeGenerator.generate(user.uid, DateTime.now());

        final projectModel = ProjectModel(
          id: 0, // drfit auto id
          code: code,
          status: status,
          agencyId: agencyId,
          ministryId: ministryId,
          stateId: stateId,
          zoneId: zoneId,
          constituency: dto.constituency,
          title: dto.title,
          amount: dto.amount,
          sponsor: dto.sponsor,
          createdBy: user.id,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );

        successfulProjects.add(projectModel.toEntity());
      } catch (e) {
        _logger.warning('Error importing ${dto.code}: $e');
      }
    }

    return successfulProjects;
  }
}

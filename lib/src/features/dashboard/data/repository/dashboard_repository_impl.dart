import 'dart:io';

import 'package:contrack/src/app/data/models/models.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/services/file_picker_service.dart';
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
  final FilePickerService _filePickerService;
  final Logger _logger = Logger('DashboardRepositoryImpl');

  DashboardRepositoryImpl(
    this._localDataSource,
    this._userSession,
    this._importService,
    this._codeGenerator,
    this._filePickerService,
  );

  static final _codePattern = RegExp(r'^ERGP-39-\d{4}-\d{4}-\d{3}$');

  bool _isValidProjectCode(String code) => _codePattern.hasMatch(code);

  @override
  Stream<List<Project>> watchRecentProjects() {
    return _userSession.userStream.switchMap((user) {
      if (user == null) {
        _logger.warning('User not logged in');
        return Stream.empty();
      }

      return _localDataSource
          .watchRecentProjects(userId: user.uid, role: user.role)
          .map((models) => models.map((e) => e.toEntity()).toList())
          .handleError((error, stackTrace) {
            _logger.severe(
              'Error watching projects for user: ${user.uid}',
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
        _logger.warning('User not logged in');
        return Stream.empty();
      }

      return _localDataSource
          .watchRecentProjectsWithDetails(userId: user.uid, role: user.role)
          .map((models) => models.map((e) => e.toEntity()).toList())
          .handleError((error, stackTrace) {
            _logger.severe(
              'Error watching projects with details for user: ${user.uid}',
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
        _logger.warning('User not logged in');
        return Stream.empty();
      }
      return _localDataSource
          .watchUnsyncProjectCount(user.uid, user.role)
          .handleError((error, stackTrace) {
            _logger.severe(
              'Error watching unsynced project count for user: ${user.uid}',
              error,
              stackTrace,
            );
            throw AppFailure.fromException(error, stackTrace);
          });
    });
  }

  @override
  Stream<Map<InHouseStatus, int>> watchProjectCountsByStatus() {
    return _userSession.userStream.switchMap((user) {
      if (user == null) {
        _logger.warning('User not logged in');
        return Stream.empty();
      }
      return _localDataSource
          .watchProjectCountsByStatus(user.uid, user.role)
          .handleError((error, stackTrace) {
            _logger.severe(
              'Error watching project counts by status for user: ${user.uid}',
              error,
              stackTrace,
            );
            throw AppFailure.fromException(error, stackTrace);
          });
    });
  }

  @override
  Stream<double> watchTotalProjectBudget() {
    return _userSession.userStream.switchMap((user) {
      if (user == null) {
        _logger.warning('User not logged in');
        return Stream.empty();
      }
      return _localDataSource
          .watchTotalProjectBudget(user.uid, user.role)
          .handleError((error, stackTrace) {
            _logger.severe(
              'Error watching total project budget for user: ${user.uid}',
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
    if (user == null) {
      _logger.warning('User not logged in');
      return [];
    }

    final dtos = await _importService.importProjectsDto(file);
    final successfulProjects = <Project>[];

    final zoneCache = <String, int>{};
    final ministryCache = <String, int>{};
    final stateCache = <int, Map<String, int>>{};
    final agencyCache = <int, Map<String, int>>{};

    try {
      final zones = await _localDataSource.getAllGeopoliticalZones();
      for (final z in zones) {
        zoneCache[z.name.toLowerCase()] = z.id;
      }
      final ministries = await _localDataSource.getAllSupervisingMinistries();
      for (final m in ministries) {
        ministryCache[m.name.toLowerCase()] = m.id;
      }
    } catch (e) {
      _logger.severe('Failed to load metadata: $e');
      return [];
    }

    for (final dto in dtos) {
      try {
        var zoneId = 0;
        var stateId = 0;
        var ministryId = 0;
        var agencyId = 0;

        if (dto.zone.isNotEmpty &&
            zoneCache.containsKey(dto.zone.toLowerCase())) {
          zoneId = zoneCache[dto.zone.toLowerCase()]!;
        }

        if (zoneId > 0 && dto.state.isNotEmpty) {
          if (!stateCache.containsKey(zoneId)) {
            final states = await _localDataSource.getStatesByZoneId(zoneId);
            stateCache[zoneId] = {
              for (var s in states) s.name.toLowerCase(): s.id,
            };
          }
          if (stateCache[zoneId]!.containsKey(dto.state.toLowerCase())) {
            stateId = stateCache[zoneId]![dto.state.toLowerCase()]!;
          }
        }

        if (dto.ministry.isNotEmpty &&
            ministryCache.containsKey(dto.ministry.toLowerCase())) {
          ministryId = ministryCache[dto.ministry.toLowerCase()]!;
        }

        if (ministryId > 0 && dto.agency.isNotEmpty) {
          if (!agencyCache.containsKey(ministryId)) {
            final agencies = await _localDataSource.getAgenciesByMinistryId(
              ministryId,
            );
            agencyCache[ministryId] = {
              for (var a in agencies) a.name.toLowerCase(): a.id,
            };
          }
          if (agencyCache[ministryId]!.containsKey(dto.agency.toLowerCase())) {
            agencyId = agencyCache[ministryId]![dto.agency.toLowerCase()]!;
          }
        }

        final projectStatus = ProjectStatus.values.firstWhere(
          (e) => e.displayName.toLowerCase() == dto.projectStatus.toLowerCase(),
          orElse: () => ProjectStatus.newProject,
        );
        final inHouseStatus = InHouseStatus.values.firstWhere(
          (e) =>
              e.displayName.toLowerCase() == dto.inHouseStatus?.toLowerCase(),
          orElse: () => InHouseStatus.notStarted,
        );

        final code = _isValidProjectCode(dto.code)
            ? dto.code
            : _codeGenerator.generate(user.uid, DateTime.now());

        final projectModel = ProjectModel(
          code: code,
          projectStatus: projectStatus,
          inHouseStatus: inHouseStatus,
          agencyId: agencyId,
          ministryId: ministryId,
          stateId: stateId,
          zoneId: zoneId,
          constituency: dto.constituency,
          title: dto.title,
          amount: dto.amount,
          sponsor: dto.sponsor,
          createdBy: user.uid,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          startDate: dto.startDate != null
              ? DateTime.tryParse(dto.startDate!)
              : null,
          endDate: dto.endDate != null ? DateTime.tryParse(dto.endDate!) : null,
        );

        successfulProjects.add(projectModel.toEntity());
      } catch (e) {
        _logger.warning('Error importing ${dto.code}: $e');
      }
    }

    return successfulProjects;
  }

  @override
  Future<String?> pickProjectFile() async {
    return _filePickerService.pickImportFile();
  }
}

import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/common/models/user_profile_model.dart';
import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/core/sync/models/unsynced_project.dart';
import 'package:drift/drift.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'user_sync_delegate.dart';

class ProjectSyncDelegate {
  final db.AppDatabase _database;
  final SupabaseClient _supabase;
  final UserSyncDelegate _userDelegate;
  final Logger _logger = Logger('ProjectSyncDelegate');

  ProjectSyncDelegate(this._database, this._supabase, this._userDelegate);

  Future<List<Map<String, dynamic>>> fetchRemoteProjects() async {
    final response = await _supabase.from('projects').select();
    return List<Map<String, dynamic>>.from(response);
  }

  Future<List<UnsyncedProject>> getUnsyncedProjects({
    required int limit,
  }) async {
    final createdByUser = _database.alias(_database.users, 'created_by_user');
    final modifiedByUser = _database.alias(_database.users, 'modified_by_user');

    final query =
        _database.select(_database.projects).join([
            leftOuterJoin(
              _database.agencies,
              _database.agencies.id.equalsExp(_database.projects.agencyId),
            ),
            leftOuterJoin(
              _database.ministries,
              _database.ministries.id.equalsExp(_database.projects.ministryId),
            ),
            leftOuterJoin(
              _database.states,
              _database.states.id.equalsExp(_database.projects.stateId),
            ),
            leftOuterJoin(
              _database.geopoliticalZones,
              _database.geopoliticalZones.id.equalsExp(
                _database.projects.zoneId,
              ),
            ),
            leftOuterJoin(
              createdByUser,
              createdByUser.uid.equalsExp(_database.projects.createdBy),
            ),
            leftOuterJoin(
              modifiedByUser,
              modifiedByUser.uid.equalsExp(_database.projects.modifiedBy),
            ),
          ])
          ..where(_database.projects.isSynced.equals(false))
          ..orderBy([
            OrderingTerm(
              expression: _database.projects.createdAt,
              mode: OrderingMode.asc,
            ),
          ])
          ..limit(limit);

    final results = await query.get();

    return results.map((row) {
      final project = row.readTable(_database.projects);
      final agencyRemoteId = row.readTableOrNull(_database.agencies)?.remoteId;
      final ministryRemoteId = row
          .readTableOrNull(_database.ministries)
          ?.remoteId;
      final stateRemoteId = row.readTableOrNull(_database.states)?.remoteId;
      final zoneRemoteId = row
          .readTableOrNull(_database.geopoliticalZones)
          ?.remoteId;
      final createdByRemoteId = row.readTableOrNull(createdByUser)?.uid;
      final modifiedByRemoteId = row.readTableOrNull(modifiedByUser)?.uid;

      return UnsyncedProject(
        project: project,
        agencyRemoteId: agencyRemoteId,
        ministryRemoteId: ministryRemoteId,
        stateRemoteId: stateRemoteId,
        zoneRemoteId: zoneRemoteId,
        createdByRemoteId: createdByRemoteId,
        modifiedByRemoteId: modifiedByRemoteId,
      );
    }).toList();
  }

  Future<void> pushProject(
    db.Project project,
    String? agencyRemoteId,
    String? ministryRemoteId,
    String? stateRemoteId,
    String? zoneRemoteId,
    String? createdByRemoteId,
    String? modifiedByRemoteId,
  ) async {
    try {
      if (project.isDeleted) {
        await _deleteProject(project);
        return;
      }

      if (project.remoteId == null || project.remoteId!.isEmpty) {
        await _insertProject(
          project,
          agencyRemoteId,
          ministryRemoteId,
          stateRemoteId,
          zoneRemoteId,
          createdByRemoteId,
          modifiedByRemoteId,
        );
      } else {
        await _updateProject(
          project,
          agencyRemoteId,
          ministryRemoteId,
          stateRemoteId,
          zoneRemoteId,
          createdByRemoteId,
          modifiedByRemoteId,
        );
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to sync project ${project.code}', e, stackTrace);
      rethrow;
    }
  }

  Future<void> _deleteProject(db.Project project) async {
    if (project.remoteId != null && project.remoteId!.isNotEmpty) {
      await _supabase.from('projects').delete().eq('id', project.remoteId!);
      _logger.info('Deleted project ${project.code} from remote');
    }

    await (_database.delete(
      _database.projects,
    )..where((t) => t.code.equals(project.code))).go();
    _logger.info('Hard deleted project ${project.code} from local database');
  }

  Future<void> upsertRemoteProject(
    Map<String, dynamic> data,
    String? currentUserId,
  ) async {
    final remoteId = data['id'] as String;
    final code = data['code'] as String;
    final statusStr = data['project_status'] as String;
    final inHouseStatusStr = data['in_house_status'] as String;
    final agencyIdStr = data['agency_id'] as String;
    final ministryIdStr = data['ministry_id'] as String;
    final stateIdStr = data['state_id'] as String;
    final zoneIdStr = data['zone_id'] as String;
    final constituency = data['constituency'] as String;
    final amount = (data['amount'] as num).toDouble();
    final title = data['title'] as String;
    final sponsor = data['sponsor'] as String?;
    final createdByUid = data['created_by'] as String;
    final modifiedByUid = data['modified_by'] as String?;
    final startDateStr = data['start_date'] as String?;
    final endDateStr = data['end_date'] as String?;
    final createdAt = DateTime.parse(data['created_at'] as String);
    final updatedAt = DateTime.parse(data['updated_at'] as String);
    final lastSyncedAtStr = data['last_synced_at'] as String?;

    final startDate = startDateStr != null
        ? DateTime.parse(startDateStr)
        : null;
    final endDate = endDateStr != null ? DateTime.parse(endDateStr) : null;
    final lastSyncedAt = lastSyncedAtStr != null
        ? DateTime.parse(lastSyncedAtStr)
        : null;

    final projectStatus = ProjectStatus.values.firstWhere(
      (e) => e.supabaseValue == statusStr,
      orElse: () => ProjectStatus.newProject,
    );

    final inHouseStatus = InHouseStatus.values.firstWhere(
      (e) => e.name == inHouseStatusStr,
      orElse: () => InHouseStatus.notStarted,
    );

    final agency = await (_database.select(
      _database.agencies,
    )..where((t) => t.remoteId.equals(agencyIdStr))).getSingleOrNull();
    final ministry = await (_database.select(
      _database.ministries,
    )..where((t) => t.remoteId.equals(ministryIdStr))).getSingleOrNull();
    final state = await (_database.select(
      _database.states,
    )..where((t) => t.remoteId.equals(stateIdStr))).getSingleOrNull();
    final zone = await (_database.select(
      _database.geopoliticalZones,
    )..where((t) => t.remoteId.equals(zoneIdStr))).getSingleOrNull();
    var createdByUser = await (_database.select(
      _database.users,
    )..where((t) => t.uid.equals(createdByUid))).getSingleOrNull();

    if (createdByUser == null) {
      try {
        _logger.info(
          'Creator $createdByUid missing locally for project $code. Fetching from remote...',
        );
        final userProfile = await _supabase
            .from('profiles')
            .select('*, user_roles!profile_id(role, is_active)')
            .eq('id', createdByUid)
            .limit(1, referencedTable: 'user_roles')
            .single()
            .withConverter((result) => UserProfileModel.fromJson(result));

        await _userDelegate.upsertRemoteProfile(userProfile);

        createdByUser = await (_database.select(
          _database.users,
        )..where((t) => t.uid.equals(createdByUid))).getSingleOrNull();
      } catch (e) {
        _logger.warning(
          'Failed to fetch missing creator $createdByUid for project $code',
          e,
        );
      }
    }

    db.User? modifiedByUser;
    if (modifiedByUid != null) {
      modifiedByUser = await (_database.select(
        _database.users,
      )..where((t) => t.uid.equals(modifiedByUid))).getSingleOrNull();
    }

    if (agency == null ||
        ministry == null ||
        state == null ||
        zone == null ||
        createdByUser == null) {
      _logger.warning(
        'Skipping project $code sync: Missing FK (Id:$remoteId Agency: ${agency != null}, Ministry: ${ministry != null}, State: ${state != null}, Zone: ${zone != null}, Creator: ${createdByUser != null})',
      );

      return;
    }

    final localProject = await (_database.select(
      _database.projects,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localProject != null) {
      if (localProject.isDeleted) {
        _logger.info(
          'Skipping update for project $code as it is marked for deletion locally',
        );
        return;
      }

      if (!localProject.isSynced && localProject.updatedAt.isAfter(updatedAt)) {
        _logger.info(
          'Skipping update for project $code as it has unsynced local changes',
        );
        return;
      }

      final localDigest = _computeProjectDigest(
        localProject.code,
        localProject.projectStatus,
        localProject.inHouseStatus,
        localProject.agencyId,
        localProject.ministryId,
        localProject.stateId,
        localProject.zoneId,
        localProject.constituency,
        localProject.amount,
        localProject.title,
        localProject.sponsor,
        localProject.createdBy,
        localProject.modifiedBy,
        localProject.startDate,
        localProject.endDate,
      );

      final remoteDigest = _computeProjectDigest(
        code,
        projectStatus,
        inHouseStatus,
        agency.id,
        ministry.id,
        state.id,
        zone.id,
        constituency,
        amount,
        title,
        sponsor,
        createdByUser.uid,
        modifiedByUser?.uid,
        startDate,
        endDate,
      );

      if (localDigest == remoteDigest) {
        _logger.info('Skipping update for project $code as it is identical');
        return;
      }
    }

    final companion = db.ProjectsCompanion(
      code: Value(code),
      remoteId: Value(remoteId),
      projectStatus: Value(projectStatus),
      inHouseStatus: Value(inHouseStatus),
      agencyId: Value(agency.id),
      ministryId: Value(ministry.id),
      stateId: Value(state.id),
      zoneId: Value(zone.id),
      constituency: Value(constituency),
      amount: Value(amount),
      title: Value(title),
      sponsor: Value(sponsor),
      createdBy: Value(createdByUser.uid),
      modifiedBy: Value(modifiedByUser?.uid),
      startDate: Value(startDate),
      endDate: Value(endDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(true),
      lastSyncedAt: Value(lastSyncedAt ?? DateTime.now()),
    );

    await _database
        .into(_database.projects)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.projects.code],
          ),
        );
  }

  Future<void> _insertProject(
    db.Project project,
    String? agencyRemoteId,
    String? ministryRemoteId,
    String? stateRemoteId,
    String? zoneRemoteId,
    String? createdByRemoteId,
    String? modifiedByRemoteId,
  ) async {
    final response = await _supabase
        .from('projects')
        .insert({
          'code': project.code,
          'project_status': project.projectStatus.supabaseValue,
          'in_house_status': project.inHouseStatus.name,
          'agency_id': agencyRemoteId,
          'ministry_id': ministryRemoteId,
          'state_id': stateRemoteId,
          'zone_id': zoneRemoteId,
          'constituency': project.constituency,
          'amount': project.amount,
          'title': project.title,
          'sponsor': project.sponsor,
          'created_by': createdByRemoteId,
          'last_synced_at': DateTime.now().toIso8601String(),
          'start_date': project.startDate?.toIso8601String(),
          'end_date': project.endDate?.toIso8601String(),
          'created_at': project.createdAt.toIso8601String(),
          'updated_at': project.updatedAt.toIso8601String(),
        })
        .select('id')
        .single();

    final remoteId = response['id'] as String;

    await (_database.update(
      _database.projects,
    )..where((t) => t.code.equals(project.code))).write(
      db.ProjectsCompanion(
        remoteId: Value(remoteId),
        isSynced: Value(true),
        lastSyncedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> _updateProject(
    db.Project project,
    String? agencyRemoteId,
    String? ministryRemoteId,
    String? stateRemoteId,
    String? zoneRemoteId,
    String? createdByRemoteId,
    String? modifiedByRemoteId,
  ) async {
    if (project.remoteId == null || project.remoteId!.isEmpty) {
      return;
    }
    await _supabase
        .from('projects')
        .update({
          'project_status': project.projectStatus.supabaseValue,
          'in_house_status': project.inHouseStatus.name,
          'agency_id': agencyRemoteId,
          'ministry_id': ministryRemoteId,
          'state_id': stateRemoteId,
          'zone_id': zoneRemoteId,
          'constituency': project.constituency,
          'amount': project.amount,
          'title': project.title,
          'sponsor': project.sponsor,
          'modified_by': modifiedByRemoteId,
          'last_synced_at': DateTime.now().toIso8601String(),
          'start_date': project.startDate?.toIso8601String(),
          'end_date': project.endDate?.toIso8601String(),
          'updated_at': project.updatedAt.toIso8601String(),
        })
        .eq('id', project.remoteId!);

    await (_database.update(
      _database.projects,
    )..where((t) => t.code.equals(project.code))).write(
      db.ProjectsCompanion(
        isSynced: Value(true),
        lastSyncedAt: Value(DateTime.now()),
      ),
    );
  }

  int _computeProjectDigest(
    String code,
    ProjectStatus projectStatus,
    InHouseStatus inHouseStatus,
    int agencyId,
    int ministryId,
    int stateId,
    int zoneId,
    String constituency,
    double amount,
    String title,
    String? sponsor,
    String createdBy,
    String? modifiedBy,
    DateTime? startDate,
    DateTime? endDate,
  ) {
    return Object.hash(
      code,
      projectStatus,
      inHouseStatus,
      agencyId,
      ministryId,
      stateId,
      zoneId,
      constituency,
      amount,
      title,
      sponsor,
      createdBy,
      modifiedBy,
      startDate,
      endDate,
    );
  }
}

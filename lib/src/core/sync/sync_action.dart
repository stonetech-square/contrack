import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart' as db;
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SyncAction {
  Future<void> syncProject(
    db.Project project,
    String? agencyRemoteId,
    String? ministryRemoteId,
    String? stateRemoteId,
    String? zoneRemoteId,
    String? createdByRemoteId,
    String? modifiedByRemoteId,
  );
  Future<void> syncUser(db.User user);
  Future<void> updateLocalFromRemoteGeopoliticalZone(Map<String, dynamic> data);
  Future<void> updateLocalFromRemoteMinistry(Map<String, dynamic> data);
  Future<void> updateLocalFromRemoteState(Map<String, dynamic> data);
  Future<void> updateLocalFromRemoteAgency(Map<String, dynamic> data);
  Future<void> updateLocalFromRemoteProfile(Map<String, dynamic> data);
  Future<void> updateLocalFromRemoteProject(
    Map<String, dynamic> data,
    int? currentUserId,
  );
}

@LazySingleton(as: SyncAction)
class SyncActionImpl implements SyncAction {
  final db.AppDatabase _database;
  final SupabaseClient _supabase;
  final Logger _logger = Logger('SyncActionImpl');

  SyncActionImpl(this._database, this._supabase);

  @override
  Future<void> syncProject(
    db.Project project,
    String? agencyRemoteId,
    String? ministryRemoteId,
    String? stateRemoteId,
    String? zoneRemoteId,
    String? createdByRemoteId,
    String? modifiedByRemoteId,
  ) async {
    try {
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

  @override
  Future<void> syncUser(db.User user) async {
    try {
      if (user.remoteId == null || user.remoteId!.isEmpty) {
        await _insertUser(user);
      } else {
        await _updateUser(user);
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to sync user ${user.username}', e, stackTrace);
      rethrow;
    }
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
          'status': project.status.name,
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
          'status': project.status.name,
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

  Future<void> _insertUser(db.User user) async {
    final response = await _supabase
        .from('users')
        .insert({
          'uid': user.uid,
          'username': user.username,
          'full_name': user.fullName,
          'email': user.email,
          'role': user.role.name,
          'is_active': user.isActive,
          'created_at': user.createdAt.toIso8601String(),
          'updated_at': user.updatedAt.toIso8601String(),
        })
        .select('id')
        .single();

    final remoteId = response['id'] as String;

    await (_database.update(
      _database.users,
    )..where((t) => t.id.equals(user.id))).write(
      db.UsersCompanion(
        remoteId: Value(remoteId),
        isSynced: Value(true),
        lastSyncedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> _updateUser(db.User user) async {
    await _supabase
        .from('users')
        .update({
          'uid': user.uid,
          'username': user.username,
          'full_name': user.fullName,
          'email': user.email,
          'role': user.role.name,
          'is_active': user.isActive,
          'updated_at': user.updatedAt.toIso8601String(),
        })
        .eq('id', user.remoteId!);

    await (_database.update(
      _database.users,
    )..where((t) => t.id.equals(user.id))).write(
      db.UsersCompanion(
        isSynced: Value(true),
        lastSyncedAt: Value(DateTime.now()),
      ),
    );
  }

  @override
  Future<void> updateLocalFromRemoteGeopoliticalZone(
    Map<String, dynamic> data,
  ) async {
    final remoteId = data['id'] as String;
    final name = data['name'] as String;
    final code = data['code'] as String;
    final createdAt = DateTime.parse(data['created_at'] as String);

    final localRecord = await (_database.select(
      _database.geopoliticalZones,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeGeopoliticalZoneDigest(
        localRecord.name,
        localRecord.code,
        localRecord.createdAt,
      );
      final remoteDigest = _computeGeopoliticalZoneDigest(
        name,
        code,
        createdAt,
      );

      if (localDigest == remoteDigest) return;
    }

    final companion = db.GeopoliticalZonesCompanion(
      remoteId: Value(remoteId),
      name: Value(name),
      code: Value(code),
      createdAt: Value(createdAt),
    );

    await _database
        .into(_database.geopoliticalZones)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.geopoliticalZones.name],
          ),
        );
  }

  @override
  Future<void> updateLocalFromRemoteMinistry(Map<String, dynamic> data) async {
    final remoteId = data['id'] as String;
    final name = data['name'] as String;
    final code = data['code'] as String;
    final isActive = data['is_active'] as bool?;
    final agencyIdStr = data['agency_id'] as String;
    final createdAt = DateTime.parse(data['created_at'] as String);
    final updatedAt = DateTime.parse(data['updated_at'] as String);

    final agency = await (_database.select(
      _database.agencies,
    )..where((t) => t.remoteId.equals(agencyIdStr))).getSingleOrNull();

    if (agency == null) {
      _logger.warning(
        'Cannot sync ministry $name: Agency $agencyIdStr not found locally',
      );
      return;
    }

    final localRecord = await (_database.select(
      _database.ministries,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeMinistryDigest(
        localRecord.name,
        localRecord.code,
        localRecord.isActive,
        localRecord.agencyId,
        localRecord.createdAt,
        localRecord.updatedAt,
      );
      final remoteDigest = _computeMinistryDigest(
        name,
        code,
        isActive ?? true,
        agency.id,
        createdAt,
        updatedAt,
      );

      if (localDigest == remoteDigest) return;
    }

    final companion = db.MinistriesCompanion(
      remoteId: Value(remoteId),
      name: Value(name),
      code: Value(code),
      isActive: Value(isActive ?? true),
      agencyId: Value(agency.id),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );

    await _database
        .into(_database.ministries)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.ministries.name],
          ),
        );
  }

  @override
  Future<void> updateLocalFromRemoteState(Map<String, dynamic> data) async {
    final remoteId = data['id'] as String;
    final name = data['name'] as String;
    final code = data['code'] as String;
    final zoneIdStr = data['zone_id'] as String;
    final createdAt = DateTime.parse(data['created_at'] as String);

    final zone = await (_database.select(
      _database.geopoliticalZones,
    )..where((t) => t.remoteId.equals(zoneIdStr))).getSingleOrNull();

    if (zone == null) {
      _logger.warning(
        'Cannot sync state $name: Zone $zoneIdStr not found locally',
      );
      return;
    }

    final localRecord = await (_database.select(
      _database.states,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeStateDigest(
        localRecord.name,
        localRecord.code,
        localRecord.zoneId,
        localRecord.createdAt,
      );
      final remoteDigest = _computeStateDigest(name, code, zone.id, createdAt);

      if (localDigest == remoteDigest) return;
    }

    final companion = db.StatesCompanion(
      remoteId: Value(remoteId),
      name: Value(name),
      code: Value(code),
      zoneId: Value(zone.id),
      createdAt: Value(createdAt),
    );

    await _database
        .into(_database.states)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.states.name],
          ),
        );
  }

  @override
  Future<void> updateLocalFromRemoteAgency(Map<String, dynamic> data) async {
    final remoteId = data['id'] as String;
    final name = data['name'] as String;
    final code = data['code'] as String;
    final isActive = data['is_active'] as bool?;
    final createdAt = DateTime.parse(data['created_at'] as String);
    final updatedAt = DateTime.parse(data['updated_at'] as String);

    final companion = db.AgenciesCompanion(
      remoteId: Value(remoteId),
      name: Value(name),
      code: Value(code),
      isActive: Value(isActive ?? true),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );

    final localRecord = await (_database.select(
      _database.agencies,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeAgencyDigest(
        localRecord.name,
        localRecord.code,
        localRecord.isActive,
        localRecord.createdAt,
        localRecord.updatedAt,
      );
      final remoteDigest = _computeAgencyDigest(
        name,
        code,
        isActive ?? true,
        createdAt,
        updatedAt,
      );

      if (localDigest == remoteDigest) return;
    }

    await _database
        .into(_database.agencies)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.agencies.name],
          ),
        );
  }

  @override
  Future<void> updateLocalFromRemoteProfile(Map<String, dynamic> data) async {
    final remoteId = data['id'] as String;
    final email = data['email'] as String;
    final fullName = data['full_name'] as String?;
    final username = data['user_name'] as String?;
    final isActive = data['is_active'] as bool?;
    final lastLoginAtStr = data['last_login_at'] as String?;
    final createdAt = DateTime.parse(data['created_at'] as String);
    final updatedAt = DateTime.parse(data['updated_at'] as String);

    final lastLoginAt = lastLoginAtStr != null
        ? DateTime.parse(lastLoginAtStr)
        : null;

    final companion = db.UsersCompanion(
      uid: Value(remoteId),
      remoteId: Value(remoteId),
      email: Value(email),
      fullName: fullName != null ? Value(fullName) : Value.absent(),
      username: Value(username ?? email.split('@')[0]),
      isActive: Value(isActive ?? true),
      role: Value(UserRole.regular),
      lastLoginAt: Value(lastLoginAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(true),
      lastSyncedAt: Value(DateTime.now()),
    );

    final localRecord = await (_database.select(
      _database.users,
    )..where((t) => t.remoteId.equals(remoteId))).getSingleOrNull();

    if (localRecord != null) {
      final localDigest = _computeUserDigest(
        localRecord.email,
        localRecord.fullName,
        localRecord.username,
        localRecord.isActive,
        localRecord.lastLoginAt,
        localRecord.createdAt,
        localRecord.updatedAt,
      );
      final remoteDigest = _computeUserDigest(
        email,
        fullName ?? '',
        username ?? email.split('@')[0],
        isActive ?? true,
        lastLoginAt,
        createdAt,
        updatedAt,
      );

      if (localDigest == remoteDigest) return;
    }

    await _database
        .into(_database.users)
        .insert(
          companion,
          onConflict: DoUpdate(
            (old) => companion,
            target: [_database.users.uid],
          ),
        );
  }

  @override
  Future<void> updateLocalFromRemoteProject(
    Map<String, dynamic> data,
    int? currentUserId,
  ) async {
    final remoteId = data['id'] as String;
    final code = data['code'] as String;
    final statusStr = data['status'] as String;
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

    final status = ProjectStatus.values.firstWhere(
      (e) => e.name == statusStr,
      orElse: () => ProjectStatus.notStarted,
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
    final createdByUser = await (_database.select(
      _database.users,
    )..where((t) => t.uid.equals(createdByUid))).getSingleOrNull();

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
      if (currentUserId != null && localProject.createdBy == currentUserId) {
        _logger.info(
          'Skipping update for project $code as it is owned by current user',
        );
        return;
      }

      final localDigest = _computeProjectDigest(
        localProject.code,
        localProject.status,
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
        status,
        agency.id,
        ministry.id,
        state.id,
        zone.id,
        constituency,
        amount,
        title,
        sponsor,
        createdByUser.id,
        modifiedByUser?.id,
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
      status: Value(status),
      agencyId: Value(agency.id),
      ministryId: Value(ministry.id),
      stateId: Value(state.id),
      zoneId: Value(zone.id),
      constituency: Value(constituency),
      amount: Value(amount),
      title: Value(title),
      sponsor: Value(sponsor),
      createdBy: Value(createdByUser.id),
      modifiedBy: Value(modifiedByUser?.id),
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

  int _computeProjectDigest(
    String code,
    ProjectStatus status,
    int agencyId,
    int ministryId,
    int stateId,
    int zoneId,
    String constituency,
    double amount,
    String title,
    String? sponsor,
    int createdBy,
    int? modifiedBy,
    DateTime? startDate,
    DateTime? endDate,
  ) {
    return Object.hash(
      code,
      status,
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

  int _computeGeopoliticalZoneDigest(
    String? name,
    String? code,
    DateTime createdAt,
  ) {
    return Object.hash(name, code, createdAt);
  }

  int _computeMinistryDigest(
    String? name,
    String? code,
    bool? isActive,
    int? agencyId,
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    return Object.hash(name, code, isActive, agencyId, createdAt, updatedAt);
  }

  int _computeStateDigest(
    String? name,
    String? code,
    int? zoneId,
    DateTime createdAt,
  ) {
    return Object.hash(name, code, zoneId, createdAt);
  }

  int _computeAgencyDigest(
    String? name,
    String? code,
    bool? isActive,
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    return Object.hash(name, code, isActive, createdAt, updatedAt);
  }

  int _computeUserDigest(
    String email,
    String? fullName,
    String? username,
    bool isActive,
    DateTime? lastLoginAt,
    DateTime createdAt,
    DateTime updatedAt,
  ) {
    return Object.hash(
      email,
      fullName,
      username,
      isActive,
      lastLoginAt,
      createdAt,
      updatedAt,
    );
  }
}

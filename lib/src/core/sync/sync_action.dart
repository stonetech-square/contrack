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
    )..where((t) => t.id.equals(project.id))).write(
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
    )..where((t) => t.id.equals(project.id))).write(
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
}

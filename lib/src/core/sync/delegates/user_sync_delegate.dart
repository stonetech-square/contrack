import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/core/common/models/user_profile_model.dart';
import 'package:drift/drift.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserSyncDelegate {
  final db.AppDatabase _database;
  final SupabaseClient _supabase;
  final Logger _logger = Logger('UserSyncDelegate');

  UserSyncDelegate(this._database, this._supabase);

  Future<List<UserProfileModel>> fetchRemoteProfiles() async {
    final response = await _supabase
        .from('profiles')
        .select('*, user_roles!profile_id(role, is_active)')
        .withConverter(
          (data) =>
              (data as List).map((e) => UserProfileModel.fromJson(e)).toList(),
        );
    return response;
  }

  Future<List<db.User>> getUnsyncedUsers({required int limit}) async {
    return (_database.select(_database.users)
          ..where((t) => t.isSynced.equals(false))
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
          ])
          ..limit(limit))
        .get();
  }

  Future<db.User?> getActiveSessionUser() async {
    final session =
        await (_database.select(_database.sessions)
              ..limit(1)
              ..orderBy([
                (t) => OrderingTerm(
                  expression: t.createdAt,
                  mode: OrderingMode.desc,
                ),
              ]))
            .getSingleOrNull();

    if (session != null && session.activeUserId != null) {
      return (_database.select(
        _database.users,
      )..where((t) => t.uid.equals(session.activeUserId!))).getSingleOrNull();
    }
    return null;
  }

  Future<void> pushUser(db.User user) async {
    try {
      if (user.remoteId == null || user.remoteId!.isEmpty) {
        await _insertUser(user);
      } else {
        await _updateUser(user);
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to push user ${user.username}', e, stackTrace);
      rethrow;
    }
  }

  Future<void> upsertRemoteProfile(UserProfileModel data) async {
    final remoteId = data.id;
    final email = data.email;
    final fullName = data.fullName;
    final username = data.userName;
    final isActive = data.isActive;
    final lastLoginAt = data.lastLoginAt;
    final createdAt = data.createdAt;
    final updatedAt = data.updatedAt;
    final resolvedName = fullName ?? username;
    final companion = db.UsersCompanion(
      uid: Value(remoteId),
      remoteId: Value(remoteId),
      email: Value(email),
      fullName: Value(resolvedName),
      username: Value(username),
      isActive: Value(isActive),
      role: Value(data.role),
      lastLoginAt: lastLoginAt != null ? Value(lastLoginAt) : Value.absent(),
      createdAt: Value(createdAt),
      updatedAt: updatedAt != null ? Value(updatedAt) : Value.absent(),
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
        resolvedName,
        username,
        isActive,
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
    )..where((t) => t.uid.equals(user.uid))).write(
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
    )..where((t) => t.uid.equals(user.uid))).write(
      db.UsersCompanion(
        isSynced: Value(true),
        lastSyncedAt: Value(DateTime.now()),
      ),
    );
  }

  int _computeUserDigest(
    String email,
    String? fullName,
    String? username,
    bool isActive,
    DateTime? lastLoginAt,
    DateTime createdAt,
    DateTime? updatedAt,
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

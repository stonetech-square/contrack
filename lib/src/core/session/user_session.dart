import 'dart:async';

import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

@singleton
class UserSession {
  final AppDatabase _db;
  final supabase.SupabaseClient _supabase;
  final _userSubject = BehaviorSubject<User?>();
  // ignore: unused_field
  StreamSubscription<supabase.AuthState>? _authSubscription;
  supabase.RealtimeChannel? _rolesSubscription;

  UserSession(this._db, this._supabase);

  Stream<User?> get userStream => _userSubject.stream;
  User? get currentUser => _userSubject.valueOrNull;

  final Logger _logger = Logger('UserSession');
  Future<void> initialize() async {
    try {
      final session = await _db.select(_db.sessions).getSingleOrNull();
      if (session != null && session.activeUserId != null) {
        final user = await (_db.select(
          _db.users,
        )..where((u) => u.uid.equals(session.activeUserId!))).getSingleOrNull();
        _userSubject.add(user);
        if (user != null) {
          _subscribeToUserRoles(user.uid);
        }
      } else {
        _userSubject.add(null);
      }
    } catch (e) {
      _userSubject.add(null);
    }

    _listenToAuthChanges();
  }

  void _listenToAuthChanges() {
    _authSubscription = _supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == supabase.AuthChangeEvent.signedOut ||
          (event == supabase.AuthChangeEvent.tokenRefreshed &&
              data.session == null)) {
        clear();
      }
    });
  }

  Future<void> setSession(String userId) async {
    await _db.transaction(() async {
      await _db.delete(_db.sessions).go();
      await _db
          .into(_db.sessions)
          .insert(SessionsCompanion.insert(activeUserId: Value(userId)));
    });

    final user = await (_db.select(
      _db.users,
    )..where((u) => u.uid.equals(userId))).getSingleOrNull();
    _userSubject.add(user);
    if (user != null) {
      _subscribeToUserRoles(user.uid);
    }
  }

  Future<void> setUser({
    required String fullName,
    required String email,
    required String username,
    required String uid,
    required UserRole role,
    bool isActive = true,
  }) async {
    final existingUser = await (_db.select(
      _db.users,
    )..where((u) => u.uid.equals(uid))).getSingleOrNull();

    if (existingUser != null) {
      await (_db.update(
        _db.users,
      )..where((u) => u.uid.equals(existingUser.uid))).write(
        UsersCompanion(
          fullName: Value(fullName),
          email: Value(email),
          username: Value(username),
          role: Value(role),
          isActive: Value(isActive),
          isSynced: Value(true),
          lastSyncedAt: Value(DateTime.now()),
          lastLoginAt: Value(DateTime.now()),
          updatedAt: Value(DateTime.now()),
        ),
      );
    } else {
      await _db
          .into(_db.users)
          .insert(
            UsersCompanion.insert(
              fullName: Value(fullName),
              email: email,
              username: username,
              uid: uid,
              role: role,
              isSynced: Value(true),
              isActive: Value(isActive),
              lastSyncedAt: Value(DateTime.now()),
              lastLoginAt: Value(DateTime.now()),
            ),
          );
    }

    await setSession(uid);
  }

  Future<void> clear() async {
    await _db.delete(_db.sessions).go();
    _userSubject.add(null);
    _rolesSubscription?.unsubscribe();
    _rolesSubscription = null;
  }

  Future<void> updateCurrentUser({
    required String fullName,
    required String username,
  }) async {
    final user = currentUser;
    if (user == null) return;

    await (_db.update(_db.users)..where((u) => u.uid.equals(user.uid))).write(
      UsersCompanion(
        fullName: Value(fullName),
        username: Value(username),
        isSynced: Value(false),
        updatedAt: Value(DateTime.now()),
      ),
    );

    final updatedUser = await (_db.select(
      _db.users,
    )..where((u) => u.uid.equals(user.uid))).getSingleOrNull();
    _userSubject.add(updatedUser);
  }

  void _subscribeToUserRoles(String userId) {
    _rolesSubscription?.unsubscribe();
    _rolesSubscription = _supabase
        .channel('public:user_roles:$userId')
        .onPostgresChanges(
          event: supabase.PostgresChangeEvent.all,
          schema: 'public',
          table: 'user_roles',
          filter: supabase.PostgresChangeFilter(
            type: supabase.PostgresChangeFilterType.eq,
            column: 'user_id',
            value: userId,
          ),
          callback: (payload) => _handleUserRoleChange(payload, userId),
        )
        .subscribe();
  }

  Future<void> _handleUserRoleChange(
    supabase.PostgresChangePayload payload,
    String userId,
  ) async {
    final newRecord = payload.newRecord;
    if (newRecord.isEmpty) return;

    final roleStr = newRecord['role'] as String?;
    UserRole? newRole;
    if (roleStr != null) {
      try {
        newRole = UserRole.values.byName(roleStr);
      } catch (_) {
        _logger.warning('Invalid role: $roleStr');
      }
    }

    final isActive = newRecord['is_active'] as bool?;

    if (newRole != null || isActive != null) {
      await (_db.update(_db.users)..where((u) => u.uid.equals(userId))).write(
        UsersCompanion(
          role: newRole != null ? Value(newRole) : const Value.absent(),
          isActive: isActive != null ? Value(isActive) : const Value.absent(),
        ),
      );

      final user = await (_db.select(
        _db.users,
      )..where((u) => u.uid.equals(userId))).getSingleOrNull();
      _userSubject.add(user);

      try {
        await _supabase.auth.refreshSession();
      } catch (_) {
        _logger.warning('Failed to refresh session');
      }
    }
    if (isActive == false) {
      clear();
      _supabase.auth.signOut();
    }
  }
}

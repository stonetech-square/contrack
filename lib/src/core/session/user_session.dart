import 'dart:async';

import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

@singleton
class UserSession {
  final AppDatabase _db;
  final supabase.SupabaseClient _supabase;
  final _userSubject = BehaviorSubject<User?>();
  // ignore: unused_field
  StreamSubscription<supabase.AuthState>? _authSubscription;

  UserSession(this._db, this._supabase);

  Stream<User?> get userStream => _userSubject.stream;
  User? get currentUser => _userSubject.valueOrNull;

  Future<void> initialize() async {
    try {
      final session = await _db.select(_db.sessions).getSingleOrNull();
      if (session != null && session.activeUserId != null) {
        final user = await (_db.select(
          _db.users,
        )..where((u) => u.uid.equals(session.activeUserId!))).getSingleOrNull();
        _userSubject.add(user);
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
  }
}

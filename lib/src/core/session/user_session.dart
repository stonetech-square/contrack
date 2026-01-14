import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class UserSession {
  final AppDatabase _db;
  final _userSubject = BehaviorSubject<User?>();

  UserSession(this._db);

  Stream<User?> get userStream => _userSubject.stream;
  User? get currentUser => _userSubject.valueOrNull;

  Future<void> initialize() async {
    try {
      final session = await _db.select(_db.sessions).getSingleOrNull();
      if (session != null && session.activeUserId != null) {
        final user = await (_db.select(
          _db.users,
        )..where((u) => u.id.equals(session.activeUserId!))).getSingleOrNull();
        _userSubject.add(user);
      } else {
        _userSubject.add(null);
      }
    } catch (e) {
      _userSubject.add(null);
    }
  }

  Future<void> setSession(int userId) async {
    await _db.transaction(() async {
      await _db.delete(_db.sessions).go();
      await _db
          .into(_db.sessions)
          .insert(SessionsCompanion.insert(activeUserId: Value(userId)));
    });

    final user = await (_db.select(
      _db.users,
    )..where((u) => u.id.equals(userId))).getSingleOrNull();
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

    final int id;
    if (existingUser != null) {
      await (_db.update(
        _db.users,
      )..where((u) => u.id.equals(existingUser.id))).write(
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
      id = existingUser.id;
    } else {
      id = await _db
          .into(_db.users)
          .insert(
            UsersCompanion.insert(
              fullName: fullName,
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

    await setSession(id);
  }

  Future<void> clear() async {
    await _db.delete(_db.sessions).go();
    _userSubject.add(null);
  }
}

import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

abstract class UserManagementLocalDataSource {
  Stream<List<User>> watchUsers({
    String? searchQuery,
    required String currentUserId,
    required UserRole currentUserRole,
  });
  Future<void> createUser(User user, {required UserRole currentUserRole});

  Future<void> updateUserStatus(
    String userId,
    bool isActive, {
    required UserRole currentUserRole,
  });
  Future<void> changeUserRole(
    String userId,
    UserRole role, {
    required UserRole currentUserRole,
  });
}

@LazySingleton(as: UserManagementLocalDataSource)
class UserManagementLocalDataSourceImpl
    implements UserManagementLocalDataSource {
  final AppDatabase _database;

  UserManagementLocalDataSourceImpl(this._database);

  @override
  Future<void> createUser(
    User user, {
    required UserRole currentUserRole,
  }) async {
    if (!currentUserRole.isSuperAdmin) return;
    final query = _database.select(_database.users)
      ..where((t) => t.uid.equals(user.uid) | t.email.equals(user.email));
    final existingUser = await query.getSingleOrNull();
    if (existingUser != null) {
      await (_database.delete(
        _database.users,
      )..where((t) => t.email.equals(user.email))).go();
    }
    await _database.into(_database.users).insert(user);
  }

  @override
  Stream<List<User>> watchUsers({
    String? searchQuery,
    required String currentUserId,
    required UserRole currentUserRole,
  }) {
    if (!currentUserRole.isSuperAdmin) return Stream.empty();
    final normalizedQuery = searchQuery?.trim().toLowerCase() ?? '';

    final query = _database.select(_database.users);

    query.where((t) {
      final excludeCurrentUser = t.uid.equals(currentUserId).not();

      if (normalizedQuery.isEmpty) {
        return excludeCurrentUser;
      }

      final searchFilter =
          t.fullName.lower().contains(normalizedQuery) |
          t.email.lower().contains(normalizedQuery) |
          t.username.lower().contains(normalizedQuery) |
          t.uid.lower().contains(normalizedQuery);

      return excludeCurrentUser & searchFilter;
    });

    query.orderBy([
      (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.asc),
    ]);

    return query.watch();
  }

  @override
  Future<void> updateUserStatus(
    String userId,
    bool isActive, {
    required UserRole currentUserRole,
  }) async {
    if (!currentUserRole.isSuperAdmin) return;
    _database.update(_database.users)
      ..where((t) => t.uid.equals(userId))
      ..write(UsersCompanion.custom(isActive: Constant(isActive)));
  }

  @override
  Future<void> changeUserRole(
    String userId,
    UserRole role, {
    required UserRole currentUserRole,
  }) async {
    if (!currentUserRole.isSuperAdmin) return;
    _database.update(_database.users)
      ..where((t) => t.uid.equals(userId))
      ..write(UsersCompanion.custom(role: Constant(role.name)));
  }
}

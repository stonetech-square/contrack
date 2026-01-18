import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

abstract class UserManagementDataSource {
  Stream<List<User>> watchUsers({
    String? searchQuery,
    required String currentUserId,
    required UserRole currentUserRole,
  });
  Future<void> createUser(User user, {required UserRole currentUserRole});
  Future<void> updateUser(User user, {required UserRole currentUserRole});
}

@LazySingleton(as: UserManagementDataSource)
class UserManagementDataSourceImpl implements UserManagementDataSource {
  final AppDatabase _database;

  UserManagementDataSourceImpl(this._database);

  @override
  Future<void> createUser(
    User user, {
    required UserRole currentUserRole,
  }) async {
    if (!currentUserRole.isAnyAdmin) return;
    await _database.into(_database.users).insert(user);
  }

  @override
  Future<void> updateUser(
    User user, {
    required UserRole currentUserRole,
  }) async {
    if (!currentUserRole.isAnyAdmin) return;
    await _database.into(_database.users).insertOnConflictUpdate(user);
  }

  @override
  Stream<List<User>> watchUsers({
    String? searchQuery,
    required String currentUserId,
    required UserRole currentUserRole,
  }) {
    if (!currentUserRole.isAnyAdmin) return Stream.empty();
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
}

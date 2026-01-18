import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/features/user_management/data/datasource/user_management_local_datasource.dart';
import 'package:contrack/src/features/user_management/data/datasource/user_management_remote_datasource.dart';
import 'package:contrack/src/features/user_management/domain/repository/user_management_repository.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserManagementRepository)
class UserManagementRepositoryImpl implements UserManagementRepository {
  final UserManagementLocalDataSource _localDataSource;
  final UserManagementRemoteDataSource _remoteDataSource;
  final UserSession _userSession;

  UserManagementRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    this._userSession,
  );

  @override
  Future<void> createUser({
    required String fullName,
    required String email,
    required String username,
    required UserRole role,
  }) async {
    final currentUser = _userSession.currentUser;
    if (currentUser == null) {
      throw Exception('No active user session');
    }
    if (!currentUser.role.isAnyAdmin) {
      throw Exception('You are not authorized to create users');
    }

    final userId = await _remoteDataSource.createUser(
      fullName: fullName,
      email: email,
      username: username,
      role: role,
    );

    final user = User(
      uid: userId,
      fullName: fullName,
      email: email,
      username: username,
      role: role,
      isActive: true,
      isSynced: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await _localDataSource.createUser(user, currentUserRole: currentUser.role);
  }

  @override
  Future<void> updateUser({
    required String userId,
    String? fullName,
    String? email,
    String? username,
  }) async {
    final currentUser = _userSession.currentUser;
    if (currentUser == null) {
      throw Exception('No active user session');
    }
    if (!currentUser.role.isAnyAdmin) {
      throw Exception('You are not authorized to update users');
    }

    final isSucess = await _remoteDataSource.updateUser(
      userId: userId,
      fullName: fullName,
      email: email,
      username: username,
    );
    if (!isSucess) {
      throw Exception('Failed to update user');
    }

    final userCompanion = UsersCompanion(
      uid: Value(userId),
      fullName: Value(fullName),
      email: email != null ? Value(email) : const Value.absent(),
      username: username != null ? Value(username) : const Value.absent(),
      updatedAt: Value(DateTime.now()),
    );

    await _localDataSource.updateUser(
      userCompanion,
      currentUserRole: currentUser.role,
    );
  }

  @override
  Stream<List<User>> watchUsers({String? searchQuery}) {
    final currentUser = _userSession.currentUser;
    if (currentUser == null) {
      throw Exception('No active user session');
    }
    return _localDataSource.watchUsers(
      searchQuery: searchQuery,
      currentUserId: currentUser.uid,
      currentUserRole: currentUser.role,
    );
  }

  @override
  Future<void> changeUserRole(String userId, UserRole role) async {
    final currentUser = _userSession.currentUser;
    if (currentUser == null) {
      throw Exception('No active user session');
    }
    if (!currentUser.role.isAnyAdmin) {
      throw Exception('You are not authorized to change user role');
    }

    final isSucess = await _remoteDataSource.changeUserRole(userId, role);
    if (!isSucess) {
      throw Exception('Failed to change user role');
    }

    final userCompanion = UsersCompanion(
      uid: Value(userId),
      role: Value(role),
      updatedAt: Value(DateTime.now()),
    );

    await _localDataSource.updateUser(
      userCompanion,
      currentUserRole: currentUser.role,
    );
  }

  @override
  Future<void> toggleUserStatus(String userId) async {
    final currentUser = _userSession.currentUser;
    if (currentUser == null) {
      throw Exception('No active user session');
    }
    if (!currentUser.role.isAnyAdmin) {
      throw Exception('You are not authorized to toggle user status');
    }

    final isSucess = await _remoteDataSource.toggleUserStatus(userId);
    if (!isSucess) {
      throw Exception('Failed to toggle user status');
    }

    final userCompanion = UsersCompanion(
      uid: Value(userId),
      isActive: Value(!currentUser.isActive),
      updatedAt: Value(DateTime.now()),
    );

    await _localDataSource.updateUser(
      userCompanion,
      currentUserRole: currentUser.role,
    );
  }
}

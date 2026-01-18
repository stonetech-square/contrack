import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/features/user_management/data/datasource/user_management_datasource.dart';
import 'package:contrack/src/features/user_management/domain/repository/user_management_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserManagementRepository)
class UserManagementRepositoryImpl implements UserManagementRepository {
  final UserManagementDataSource _dataSource;
  final UserSession _userSession;

  UserManagementRepositoryImpl(this._dataSource, this._userSession);

  @override
  Future<void> createUser(User user) async {
    final currentUser = _userSession.currentUser;
    if (currentUser == null) {
      throw Exception('No active user session');
    }
    await _dataSource.createUser(user, currentUserRole: currentUser.role);
  }

  @override
  Future<void> updateUser(User user) async {
    final currentUser = _userSession.currentUser;
    if (currentUser == null) {
      throw Exception('No active user session');
    }
    await _dataSource.updateUser(user, currentUserRole: currentUser.role);
  }

  @override
  Stream<List<User>> watchUsers({String? searchQuery}) {
    final currentUser = _userSession.currentUser;
    if (currentUser == null) {
      throw Exception('No active user session');
    }
    return _dataSource.watchUsers(
      searchQuery: searchQuery,
      currentUserId: currentUser.uid,
      currentUserRole: currentUser.role,
    );
  }
}

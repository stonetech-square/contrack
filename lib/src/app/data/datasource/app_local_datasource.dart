import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/core/database/database.dart' show User;
import 'package:contrack/src/core/session/user_session.dart';
import 'package:injectable/injectable.dart';

abstract class AppLocalDataSource {
  Stream<User?> watchUser();
  Future<void> setUser(String uid);
  Future<void> clearSession();
  Future<void> updateUser(AppUserModel user);
}

@LazySingleton(as: AppLocalDataSource)
class AppLocalDataSourceImpl implements AppLocalDataSource {
  final UserSession _userSession;

  AppLocalDataSourceImpl(this._userSession);

  @override
  Stream<User?> watchUser() => _userSession.userStream;

  @override
  Future<void> setUser(String userId) async {
    await _userSession.setSession(userId);
  }

  @override
  Future<void> clearSession() async {
    await _userSession.clear();
  }

  @override
  Future<void> updateUser(AppUserModel user) async {
    await _userSession.updateCurrentUser(
      fullName: user.fullName,
      username: user.username,
      
    );
  }
}

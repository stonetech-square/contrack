import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:contrack/src/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final UserSession _userSession;

  AuthRepositoryImpl(this._authRemoteDataSource, this._userSession);

  @override
  Future<void> signInWithCredentials(String email, String password) async {
    try {
      final uid =
          await _authRemoteDataSource.signInWithCredentials(email, password) ??
          '';
      if (uid.isEmpty) {
        throw AppFailure('Failed to sign in');
      }
      final remoteUser = await _authRemoteDataSource.getRemoteUser(uid);
      if (remoteUser == null) {
        throw AppFailure('User Profile not found');
      }
      if (remoteUser.isActive == false) {
        throw AppFailure('User is not active, please contact support');
      }
      await _userSession.setUser(
        fullName: remoteUser.fullName ?? remoteUser.userName,
        email: remoteUser.email,
        username: remoteUser.userName,
        uid: remoteUser.id,
        role: remoteUser.role,
        isActive: remoteUser.isActive,
      );
    } catch (e, stackTrace) {
      throw AppFailure.fromException(e, stackTrace);
    }
  }

  @override
  Future<void> changePassword(String password) async {
    try {
      await _authRemoteDataSource.changePassword(password);
    } catch (e, stackTrace) {
      throw AppFailure.fromException(e, stackTrace);
    }
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    try {
      await _authRemoteDataSource.verifyOtp(email, otp);
    } catch (e, stackTrace) {
      throw AppFailure.fromException(e, stackTrace);
    }
  }
}

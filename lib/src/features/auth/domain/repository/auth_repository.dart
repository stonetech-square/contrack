abstract class AuthRepository {
  Future<void> signInWithCredentials(String email, String password);
  Future<void> changePassword(String password);
  Future<void> verifyOtp(String email, String otp);
}

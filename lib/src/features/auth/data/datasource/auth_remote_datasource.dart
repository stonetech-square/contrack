import 'package:contrack/src/app/data/models/user_profile_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Future<String?> signInWithCredentials(String email, String password);
  Future<void> changePassword(String password);
  Future<UserProfileModel?> getRemoteUser(String uid);
  Future<void> verifyOtp(String email, String otp);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient _supabase;

  AuthRemoteDataSourceImpl(this._supabase);

  @override
  Future<String?> signInWithCredentials(String email, String password) async {
    final result = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final supabaseUser = result.user;

    return supabaseUser?.id;
  }

  @override
  Future<void> changePassword(String password) async {
    await _supabase.auth.updateUser(UserAttributes(password: password));
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    await _supabase.auth.verifyOTP(
      type: OtpType.invite,
      email: email,
      token: otp,
    );
  }

  @override
  Future<UserProfileModel?> getRemoteUser(String uid) async {
    return await _supabase
        .from('profiles')
        .select('*, user_roles!profile_id(role, is_active)')
        .eq('id', uid)
        .limit(1, referencedTable: 'user_roles')
        .single()
        .withConverter((result) => UserProfileModel.fromJson(result));
  }
}

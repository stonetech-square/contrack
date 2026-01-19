import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppRemoteDatasource {
  Future<void> logOut();
  Future<void> updateUser(AppUserModel user);
}

@LazySingleton(as: AppRemoteDatasource)
class AppRemoteDatasourceImpl implements AppRemoteDatasource {
  final SupabaseClient _supabase;

  AppRemoteDatasourceImpl(this._supabase);

  @override
  Future<void> logOut() async {
    await _supabase.auth.signOut();
  }

  @override
  Future<void> updateUser(AppUserModel user) async {
    await _supabase
        .from('profiles')
        .update({'full_name': user.fullName, 'user_name': user.username})
        .eq('id', user.uid);
    await _supabase.auth.updateUser(
      UserAttributes(
        data: {'full_name': user.fullName, 'user_name': user.username},
      ),
    );
  }
}

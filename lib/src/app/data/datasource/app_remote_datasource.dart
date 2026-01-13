import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AppRemoteDatasource {
  Future<void> logOut();
}

@LazySingleton(as: AppRemoteDatasource)
class AppRemoteDatasourceImpl implements AppRemoteDatasource {
  final SupabaseClient _supabase;

  AppRemoteDatasourceImpl(this._supabase);

  @override
  Future<void> logOut() async {
    await _supabase.auth.signOut();
  }
}

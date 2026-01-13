import 'package:contrack/src/core/database/database.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class AppModule {
  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;

  @singleton
  AppDatabase get appDatabase => AppDatabase();
}

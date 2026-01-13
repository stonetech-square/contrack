// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../core/database/database.dart' as _i339;
import '../../core/database/seed.dart' as _i964;
import '../../core/network/network_info.dart' as _i892;
import '../../core/session/user_session.dart' as _i26;
import '../../core/sync/sync_action.dart' as _i889;
import '../../core/sync/sync_service.dart' as _i103;
import '../../core/utils/project_code_generator.dart' as _i869;
import '../../features/auth/data/datasource/auth_remote_datasource.dart'
    as _i175;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecase/change_password_use_case.dart'
    as _i335;
import '../../features/auth/domain/usecase/sign_in_use_case.dart' as _i277;
import '../../features/auth/domain/usecase/verify_otp_use_case.dart' as _i221;
import '../../features/auth/presentation/bloc/sign_in_bloc.dart' as _i135;
import '../../features/dashboard/data/datasource/dashboard_local_datasource.dart'
    as _i642;
import '../../features/dashboard/data/repository/dashboard_repository_impl.dart'
    as _i604;
import '../../features/dashboard/domain/repository/dashboard_repository.dart'
    as _i275;
import '../../features/dashboard/domain/usecase/watch_dashboard_stats_use_case.dart'
    as _i862;
import '../../features/dashboard/domain/usecase/watch_recent_projects_use_case.dart'
    as _i835;
import '../../features/dashboard/presentation/bloc/dashboard_bloc.dart'
    as _i652;
import '../data/datasource/app_local_datasource.dart' as _i293;
import '../data/datasource/app_remote_datasource.dart' as _i245;
import '../data/repository/app_repository_impl.dart' as _i309;
import '../domain/repository/app_repository.dart' as _i454;
import '../domain/usecase/log_out_use_case.dart' as _i504;
import '../domain/usecase/set_active_user_use_case.dart' as _i407;
import '../domain/usecase/sync_now_use_case.dart' as _i948;
import '../domain/usecase/watch_app_sync_status_use_case.dart' as _i528;
import '../domain/usecase/watch_app_user_use_case.dart' as _i353;
import '../presentation/bloc/app_bloc.dart' as _i813;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i339.AppDatabase>(() => appModule.appDatabase);
    gh.lazySingleton<_i454.SupabaseClient>(() => appModule.supabaseClient);
    gh.lazySingleton<_i869.ProjectCodeGenerator>(
      () => _i869.ProjectCodeGenerator(),
    );
    gh.lazySingleton<_i642.DashboardLocalDataSource>(
      () => _i642.DashboardLocalDataSourceImpl(gh<_i339.AppDatabase>()),
    );
    gh.lazySingleton<_i889.SyncAction>(
      () => _i889.SyncActionImpl(
        gh<_i339.AppDatabase>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i245.AppRemoteDatasource>(
      () => _i245.AppRemoteDatasourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i892.NetworkInfo>(() => _i892.NetworkInfoImpl());
    gh.lazySingleton<_i175.AuthRemoteDataSource>(
      () => _i175.AuthRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i964.DatabaseSeeder>(
      () => _i964.DatabaseSeeder(
        gh<_i339.AppDatabase>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i103.SyncService>(
      () => _i103.SyncServiceImpl(
        gh<_i892.NetworkInfo>(),
        gh<_i339.AppDatabase>(),
        gh<_i889.SyncAction>(),
      ),
    );
    gh.singleton<_i26.UserSession>(
      () => _i26.UserSession(gh<_i339.AppDatabase>()),
    );
    gh.lazySingleton<_i293.AppLocalDataSource>(
      () => _i293.AppLocalDataSourceImpl(gh<_i26.UserSession>()),
    );
    gh.lazySingleton<_i961.AuthRepository>(
      () => _i409.AuthRepositoryImpl(
        gh<_i175.AuthRemoteDataSource>(),
        gh<_i26.UserSession>(),
      ),
    );
    gh.lazySingleton<_i275.DashboardRepository>(
      () => _i604.DashboardRepositoryImpl(
        gh<_i642.DashboardLocalDataSource>(),
        gh<_i26.UserSession>(),
      ),
    );
    gh.lazySingleton<_i335.ChangePasswordUseCase>(
      () => _i335.ChangePasswordUseCase(gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i277.SignInUseCase>(
      () => _i277.SignInUseCase(gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i221.VerifyOtpUseCase>(
      () => _i221.VerifyOtpUseCase(gh<_i961.AuthRepository>()),
    );
    gh.lazySingleton<_i454.AppRepository>(
      () => _i309.AppRepositoryImpl(
        gh<_i293.AppLocalDataSource>(),
        gh<_i245.AppRemoteDatasource>(),
        gh<_i103.SyncService>(),
      ),
    );
    gh.lazySingleton<_i504.LogOutUseCase>(
      () => _i504.LogOutUseCase(gh<_i454.AppRepository>()),
    );
    gh.factory<_i135.SignInBloc>(
      () => _i135.SignInBloc(gh<_i277.SignInUseCase>()),
    );
    gh.factory<_i948.SyncNowUseCase>(
      () => _i948.SyncNowUseCase(gh<_i454.AppRepository>()),
    );
    gh.factory<_i528.WatchAppSyncStatusUseCase>(
      () => _i528.WatchAppSyncStatusUseCase(gh<_i454.AppRepository>()),
    );
    gh.lazySingleton<_i407.SetActiveUserUseCase>(
      () => _i407.SetActiveUserUseCase(gh<_i454.AppRepository>()),
    );
    gh.lazySingleton<_i353.WatchAppUserUseCase>(
      () => _i353.WatchAppUserUseCase(gh<_i454.AppRepository>()),
    );
    gh.lazySingleton<_i862.WatchDashboardStatsUseCase>(
      () => _i862.WatchDashboardStatsUseCase(gh<_i275.DashboardRepository>()),
    );
    gh.lazySingleton<_i835.WatchRecentProjectsUseCase>(
      () => _i835.WatchRecentProjectsUseCase(gh<_i275.DashboardRepository>()),
    );
    gh.lazySingleton<_i835.WatchRecentProjectsWithDetailsUseCase>(
      () => _i835.WatchRecentProjectsWithDetailsUseCase(
        gh<_i275.DashboardRepository>(),
      ),
    );
    gh.factory<_i652.DashboardBloc>(
      () => _i652.DashboardBloc(
        gh<_i862.WatchDashboardStatsUseCase>(),
        gh<_i835.WatchRecentProjectsWithDetailsUseCase>(),
      ),
    );
    gh.lazySingleton<_i813.AppBloc>(
      () => _i813.AppBloc(
        gh<_i353.WatchAppUserUseCase>(),
        gh<_i407.SetActiveUserUseCase>(),
        gh<_i504.LogOutUseCase>(),
        gh<_i528.WatchAppSyncStatusUseCase>(),
        gh<_i948.SyncNowUseCase>(),
        gh<_i964.DatabaseSeeder>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}

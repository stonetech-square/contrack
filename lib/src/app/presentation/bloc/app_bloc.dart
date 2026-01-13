import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/app/domain/usecase/sync_now_use_case.dart';
import 'package:contrack/src/app/domain/usecase/watch_app_sync_status_use_case.dart';
import 'package:contrack/src/core/database/seed.dart';
import 'package:contrack/src/core/sync/app_sync_status.dart';
import 'package:contrack/src/app/domain/entities/app_user.dart';
import 'package:contrack/src/app/domain/usecase/log_out_use_case.dart';
import 'package:contrack/src/app/domain/usecase/set_active_user_use_case.dart';
import 'package:contrack/src/app/domain/usecase/watch_app_user_use_case.dart';
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

part 'app_bloc.g.dart';
part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

@lazySingleton
class AppBloc extends HydratedBloc<AppEvent, AppState> {
  final WatchAppUserUseCase _watchAppUserUseCase;
  final SetActiveUserUseCase _setActiveUserUseCase;
  final LogOutUseCase _logOutUseCase;
  final WatchAppSyncStatusUseCase _watchAppSyncStatusUseCase;
  final SyncNowUseCase _syncNowUseCase;
  final DatabaseSeeder _databaseSeeder;

  AppBloc(
    this._watchAppUserUseCase,
    this._setActiveUserUseCase,
    this._logOutUseCase,
    this._watchAppSyncStatusUseCase,
    this._syncNowUseCase,
    this._databaseSeeder,
  ) : super(const AppState()) {
    on<AppStarted>(_onStarted);
    on<AppThemeModeToggled>(_onThemeModeChanged);
    on<AppUserChanged>(_onUserChanged);
    on<AppLogedOut>(_onLogedOut);
    on<AppSyncRequested>(_onSyncRequested);
  }

  Future<void> _onStarted(AppStarted event, Emitter<AppState> emit) async {
    final isSeeded = await _databaseSeeder.isSeeded();
    if (!isSeeded) {
      emit(state.copyWith(isSeeding: true));
      await _databaseSeeder.seedAll();
      emit(state.copyWith(isSeeding: false));
    }

    await Future.wait([
      emit.forEach<AppUserModel?>(
        _watchAppUserUseCase(NoParams()),
        onData: (user) => state.copyWith(user: user, error: null),
        onError: (error, stackTrace) {
          final failure = error is Failure
              ? error
              : AppFailure.fromException(error, stackTrace);
          return state.copyWith(error: failure.message);
        },
      ),
      emit.forEach<AppSyncStatus>(
        _watchAppSyncStatusUseCase(NoParams()),
        onData: (status) => state.copyWith(syncStatus: status),
      ),
    ]);
  }

  void _onThemeModeChanged(AppThemeModeToggled event, Emitter<AppState> emit) {
    final currentThemeModeIndex = state.themeMode;
    final nextThemeModeIndex = currentThemeModeIndex == 3 - 1
        ? 0
        : currentThemeModeIndex + 1;
    emit(state.copyWith(themeMode: nextThemeModeIndex));
  }

  Future<void> _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) async {
    try {
      await _setActiveUserUseCase(event.user!.id);
      emit(state.copyWith(user: event.user?.toModel(), error: null));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(state.copyWith(error: failure.message));
    }
  }

  Future<void> _onLogedOut(AppLogedOut event, Emitter<AppState> emit) async {
    try {
      await _logOutUseCase(NoParams());
      emit(state.copyWith(user: null, error: null));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(state.copyWith(error: failure.message));
    }
  }

  Future<void> _onSyncRequested(
    AppSyncRequested event,
    Emitter<AppState> emit,
  ) async {
    try {
      await _syncNowUseCase(NoParams());
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(state.copyWith(error: failure.message));
    }
  }

  @override
  AppState? fromJson(Map<String, dynamic> json) {
    return AppState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(AppState state) {
    return state.toJson();
  }
}

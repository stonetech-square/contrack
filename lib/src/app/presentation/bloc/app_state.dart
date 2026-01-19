part of 'app_bloc.dart';

@freezed
sealed class AppState with _$AppState {
  const factory AppState({
    @Default(0) int themeMode, //0: system, 1: light, 2: dark
    AppUserModel? user,
    String? error,
    @Default(AppSyncStatus.offline) AppSyncStatus syncStatus,
    @Default(false) bool isSeeding,
    @Default(false) bool isUpdatingProfile,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}

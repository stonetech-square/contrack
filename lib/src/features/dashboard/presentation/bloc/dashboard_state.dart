
part of 'dashboard_bloc.dart';
@freezed
sealed class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(false) bool isLoading,
    @Default([]) List<ProjectWithDetails> recentProjects,
    required DashboardStats stats,
    String? error,
    String? userId,
    List<Project>? importedProjects,
  }) = _DashboardState;

  factory DashboardState.empty() => DashboardState(
    stats: DashboardStats.empty(),
    recentProjects: [],
    error: null,
    isLoading: false,
    userId: null,
    importedProjects: null,
  );
}

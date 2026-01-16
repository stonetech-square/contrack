import 'package:contrack/src/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
sealed class DashboardState with _$DashboardState {
  const factory DashboardState({
    @Default(false) bool isLoading,
    @Default([]) List<ProjectWithDetails> recentProjects,
    required DashboardStats stats,
    String? error,
    int? userId,
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

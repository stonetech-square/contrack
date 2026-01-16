part of 'all_projects_bloc.dart';

@freezed
sealed class AllProjectsState with _$AllProjectsState {
  const factory AllProjectsState({
    @Default([]) List<Project> projects,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isExporting,
    String? exportFilePath,
    String? exportError,
  }) = _AllProjectsState;
}

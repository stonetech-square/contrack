part of 'all_projects_bloc.dart';

@freezed
sealed class AllProjectsState with _$AllProjectsState {
  const factory AllProjectsState({
    @Default([]) List<Project> projects,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _AllProjectsState;
}

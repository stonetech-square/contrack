part of 'project_bloc.dart';

@freezed
sealed class ProjectState with _$ProjectState {
  const factory ProjectState({
    @Default('') String projectCode,
    ProjectWithDetails? project,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isExporting,
    String? exportFilePath,
    String? exportError,
  }) = _ProjectState;
}

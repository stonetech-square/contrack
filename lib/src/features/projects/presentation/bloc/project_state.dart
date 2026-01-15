part of 'project_bloc.dart';

@freezed
sealed class ProjectState with _$ProjectState {
  const factory ProjectState({
    @Default('') String projectCode,
    ProjectWithDetails? project,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _ProjectState;
}

part of 'all_projects_bloc.dart';

@freezed
sealed class AllProjectsState with _$AllProjectsState {
  const AllProjectsState._();

  const factory AllProjectsState({
    @Default([]) List<ProjectWithDetails> projects,
    @Default(1) int page,
    @Default(10) int pageSize,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isExporting,
    String? exportFilePath,
    String? exportError,
  }) = _AllProjectsState;

  List<ProjectWithDetails> get paginatedProjects {
    if (projects.isEmpty) return [];
    final startIndex = (page - 1) * pageSize;
    final endIndex = startIndex + pageSize;
    if (startIndex >= projects.length) return [];
    return projects.sublist(
      startIndex,
      endIndex > projects.length ? projects.length : endIndex,
    );
  }
}

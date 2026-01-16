part of 'all_projects_bloc.dart';

abstract class AllProjectsEvent extends Equatable {
  const AllProjectsEvent();

  @override
  List<Object?> get props => [];
}

class AllProjectsWatchStarted extends AllProjectsEvent {
  const AllProjectsWatchStarted({
    this.query,
    this.filter = const ProjectFilter(),
  });

  final String? query;
  final ProjectFilter filter;

  @override
  List<Object?> get props => [query, filter];
}

class AllProjectsExportRequested extends AllProjectsEvent {
  const AllProjectsExportRequested(this.format);

  final ExportFormat format;

  @override
  List<Object?> get props => [format];
}

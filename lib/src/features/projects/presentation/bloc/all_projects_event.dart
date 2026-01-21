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
  const AllProjectsExportRequested(
    this.format, {
    this.type = ExportType.preferred,
  });

  final ExportFormat format;
  final ExportType type;

  @override
  List<Object?> get props => [format, type];
}

class AllProjectsPageChanged extends AllProjectsEvent {
  const AllProjectsPageChanged(this.page);

  final int page;

  @override
  List<Object?> get props => [page];
}

class AllProjectsProjectDeleted extends AllProjectsEvent {
  const AllProjectsProjectDeleted(this.code);

  final String code;

  @override
  List<Object?> get props => [code];
}

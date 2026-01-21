part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class DashboardStarted extends DashboardEvent {}

class DashboardImportRequested extends DashboardEvent {}

class DashboardExportRequested extends DashboardEvent {
  final ExportFormat format;
  final ExportType type;

  const DashboardExportRequested(
    this.format, {
    this.type = ExportType.preferred,
  });

  @override
  List<Object?> get props => [format, type];
}

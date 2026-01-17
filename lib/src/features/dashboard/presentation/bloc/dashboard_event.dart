part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object?> get props => [];
}

class DashboardStarted extends DashboardEvent {}

class DashboardProjectImported extends DashboardEvent {
  final String path;

  const DashboardProjectImported(this.path);

  @override
  List<Object?> get props => [path];
}

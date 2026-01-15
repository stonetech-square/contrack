part of 'project_bloc.dart';

abstract class ProjectEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProjectFetchByCodeEvent extends ProjectEvent {
  final String code;

  ProjectFetchByCodeEvent(this.code);

  @override
  List<Object?> get props => [code];
}

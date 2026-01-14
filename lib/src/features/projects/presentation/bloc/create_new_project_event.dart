part of 'create_new_project_bloc.dart';

abstract class CreateNewProjectEvent extends Equatable {
  const CreateNewProjectEvent();

  @override
  List<Object?> get props => [];
}

class CreateNewProjectStartedEvent extends CreateNewProjectEvent {
  const CreateNewProjectStartedEvent();
}

class CreateNewProjectStatusChangedEvent extends CreateNewProjectEvent {
  final ProjectStatus status;
  const CreateNewProjectStatusChangedEvent({required this.status});

  @override
  List<Object?> get props => [status];
}

class CreateNewProjectImplementingAgencyChangedEvent
    extends CreateNewProjectEvent {
  final int implementingAgencyId;
  const CreateNewProjectImplementingAgencyChangedEvent({
    required this.implementingAgencyId,
  });

  @override
  List<Object?> get props => [implementingAgencyId];
}

class CreateNewProjectSupervisingMinistryChangedEvent
    extends CreateNewProjectEvent {
  final int supervisingMinistryId;
  const CreateNewProjectSupervisingMinistryChangedEvent({
    required this.supervisingMinistryId,
  });

  @override
  List<Object?> get props => [supervisingMinistryId];
}

class CreateNewProjectStateChangedEvent extends CreateNewProjectEvent {
  final int stateId;
  const CreateNewProjectStateChangedEvent({required this.stateId});

  @override
  List<Object?> get props => [stateId];
}

class CreateNewProjectGeopoliticalZoneChangedEvent
    extends CreateNewProjectEvent {
  final int geopoliticalZoneId;
  const CreateNewProjectGeopoliticalZoneChangedEvent({
    required this.geopoliticalZoneId,
  });

  @override
  List<Object?> get props => [geopoliticalZoneId];
}

class CreateNewProjectConstituencyChangedEvent extends CreateNewProjectEvent {
  final String constituency;
  const CreateNewProjectConstituencyChangedEvent({required this.constituency});

  @override
  List<Object?> get props => [constituency];
}

class CreateNewProjectTitleChangedEvent extends CreateNewProjectEvent {
  final String title;
  const CreateNewProjectTitleChangedEvent({required this.title});

  @override
  List<Object?> get props => [title];
}

class CreateNewProjectSponsorChangedEvent extends CreateNewProjectEvent {
  final String sponsor;
  const CreateNewProjectSponsorChangedEvent({required this.sponsor});

  @override
  List<Object?> get props => [sponsor];
}

class CreateNewProjectBugetChangedEvent extends CreateNewProjectEvent {
  final double budget;
  const CreateNewProjectBugetChangedEvent({required this.budget});

  @override
  List<Object?> get props => [budget];
}

class CreateNewProjectStartDateChangedEvent extends CreateNewProjectEvent {
  final DateTime startDate;
  const CreateNewProjectStartDateChangedEvent({required this.startDate});

  @override
  List<Object?> get props => [startDate];
}

class CreateNewProjectEndDateChangedEvent extends CreateNewProjectEvent {
  final DateTime endDate;
  const CreateNewProjectEndDateChangedEvent({required this.endDate});

  @override
  List<Object?> get props => [endDate];
}

class CreateNewProjectSubmittedEvent extends CreateNewProjectEvent {
  const CreateNewProjectSubmittedEvent();
}

class CreateNewProjectCancelledEvent extends CreateNewProjectEvent {
  const CreateNewProjectCancelledEvent();
}

part of 'create_new_project_bloc.dart';

sealed class CreateNewProjectEvent extends Equatable {
  const CreateNewProjectEvent();

  @override
  List<Object?> get props => [];
}

final class CreateNewProjectStarted extends CreateNewProjectEvent {
  const CreateNewProjectStarted([this.projects]);
  final List<Project>? projects;

  @override
  List<Object?> get props => [projects];
}

final class EntryAdded extends CreateNewProjectEvent {
  const EntryAdded();
}

final class EntryRemoved extends CreateNewProjectEvent {
  const EntryRemoved(this.index);
  final int index;

  @override
  List<Object?> get props => [index];
}

final class EntrySelected extends CreateNewProjectEvent {
  const EntrySelected(this.index);
  final int index;

  @override
  List<Object?> get props => [index];
}

final class EntryFieldChanged extends CreateNewProjectEvent {
  const EntryFieldChanged({
    required this.index,
    this.status,
    this.implementingAgencyId,
    this.supervisingMinistryId,
    this.geopoliticalZoneId,
    this.stateId,
    this.constituency,
    this.title,
    this.sponsor,
    this.budget,
    this.startDate,
    this.endDate,
  });

  final int index;
  final ProjectStatus? status;
  final int? implementingAgencyId;
  final int? supervisingMinistryId;
  final int? geopoliticalZoneId;
  final int? stateId;
  final String? constituency;
  final String? title;
  final String? sponsor;
  final double? budget;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  List<Object?> get props => [
        index,
        status,
        implementingAgencyId,
        supervisingMinistryId,
        geopoliticalZoneId,
        stateId,
        constituency,
        title,
        sponsor,
        budget,
        startDate,
        endDate,
      ];
}

final class CreateNewProjectSubmitted extends CreateNewProjectEvent {
  const CreateNewProjectSubmitted();
}

final class CreateNewProjectCancelled extends CreateNewProjectEvent {
  const CreateNewProjectCancelled();
}

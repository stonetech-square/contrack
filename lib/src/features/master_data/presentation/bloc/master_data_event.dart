part of 'master_data_bloc.dart';

abstract class MasterDataEvent extends Equatable {
  const MasterDataEvent();

  @override
  List<Object?> get props => [];
}

class MasterDataStarted extends MasterDataEvent {
  const MasterDataStarted();

  @override
  List<Object?> get props => [];
}

class MinistrySearchChanged extends MasterDataEvent {
  final String query;
  const MinistrySearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class AgencySearchChanged extends MasterDataEvent {
  final String query;
  const AgencySearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class MinistryAdded extends MasterDataEvent {
  final String name;
  final String code;
  const MinistryAdded({required this.name, required this.code});

  @override
  List<Object?> get props => [name, code];
}

class AgencyAdded extends MasterDataEvent {
  final String name;
  final String code;
  final int ministryId;
  final String? ministryRemoteId;

  const AgencyAdded({
    required this.name,
    required this.code,
    required this.ministryId,
    this.ministryRemoteId,
  });

  @override
  List<Object?> get props => [name, code, ministryId, ministryRemoteId];
}

class MinistryDeleted extends MasterDataEvent {
  final Ministry ministry;
  const MinistryDeleted(this.ministry);

  @override
  List<Object?> get props => [ministry];
}

class AgencyDeleted extends MasterDataEvent {
  final Agency agency;
  const AgencyDeleted(this.agency);

  @override
  List<Object?> get props => [agency];
}

class MinistryUpdated extends MasterDataEvent {
  final Ministry ministry;
  const MinistryUpdated(this.ministry);

  @override
  List<Object?> get props => [ministry];
}

class AgencyUpdated extends MasterDataEvent {
  final AgencyWithMinistry agencyWithMinistry;
  const AgencyUpdated(this.agencyWithMinistry);

  @override
  List<Object?> get props => [agencyWithMinistry];
}

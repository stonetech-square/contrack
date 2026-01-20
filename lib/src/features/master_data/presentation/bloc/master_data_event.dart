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

class AgencySearchChanged extends MasterDataEvent {
  final String query;
  const AgencySearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class MinistrySearchChanged extends MasterDataEvent {
  final String query;
  const MinistrySearchChanged(this.query);

  @override
  List<Object?> get props => [query];
}

class AgencyAdded extends MasterDataEvent {
  final String name;
  final String code;
  const AgencyAdded({required this.name, required this.code});

  @override
  List<Object?> get props => [name, code];
}

class MinistryAdded extends MasterDataEvent {
  final String name;
  final String code;
  final int agencyId;
  final String? agencyRemoteId;

  const MinistryAdded({
    required this.name,
    required this.code,
    required this.agencyId,
    this.agencyRemoteId,
  });

  @override
  List<Object?> get props => [name, code, agencyId, agencyRemoteId];
}

class AgencyDeleted extends MasterDataEvent {
  final Agency agency;
  const AgencyDeleted(this.agency);

  @override
  List<Object?> get props => [agency];
}

class MinistryDeleted extends MasterDataEvent {
  final Ministry ministry;
  const MinistryDeleted(this.ministry);

  @override
  List<Object?> get props => [ministry];
}

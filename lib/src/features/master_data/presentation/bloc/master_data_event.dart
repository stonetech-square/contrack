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

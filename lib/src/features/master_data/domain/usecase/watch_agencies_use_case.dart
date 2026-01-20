import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/data/models/agency_with_ministry.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchAgenciesUseCase
    implements UseCase<Stream<List<AgencyWithMinistry>>, WatchAgenciesParams> {
  final MasterDataRepository _repository;

  WatchAgenciesUseCase(this._repository);

  @override
  Stream<List<AgencyWithMinistry>> call(WatchAgenciesParams params) {
    return _repository.watchAgencies(
      query: params.query,
      ministryId: params.ministryId,
    );
  }
}

class WatchAgenciesParams extends Equatable {
  final String? query;
  final int? ministryId;

  const WatchAgenciesParams({this.query, this.ministryId});

  @override
  List<Object?> get props => [query, ministryId];
}

import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/data/models/ministry_with_agency.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchMinistriesUseCase
    implements
        UseCase<Stream<List<MinistryWithAgency>>, WatchMinistriesParams> {
  final MasterDataRepository _repository;

  WatchMinistriesUseCase(this._repository);

  @override
  Stream<List<MinistryWithAgency>> call(WatchMinistriesParams params) {
    return _repository.watchMinistries(
      query: params.query,
      agencyId: params.agencyId,
    );
  }
}

class WatchMinistriesParams extends Equatable {
  final String? query;
  final int? agencyId;

  const WatchMinistriesParams({this.query, this.agencyId});

  @override
  List<Object?> get props => [query, agencyId];
}

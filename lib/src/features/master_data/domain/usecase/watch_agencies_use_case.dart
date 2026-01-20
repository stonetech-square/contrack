import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchAgenciesUseCase
    implements UseCase<Stream<List<Agency>>, WatchAgenciesParams> {
  final MasterDataRepository _repository;

  WatchAgenciesUseCase(this._repository);

  @override
  Stream<List<Agency>> call(WatchAgenciesParams params) {
    return _repository.watchAgencies(query: params.query);
  }
}

class WatchAgenciesParams extends Equatable {
  final String? query;

  const WatchAgenciesParams({this.query});

  @override
  List<Object?> get props => [query];
}

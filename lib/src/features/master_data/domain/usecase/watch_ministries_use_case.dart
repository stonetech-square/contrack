import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchMinistriesUseCase
    implements UseCase<Stream<List<Ministry>>, WatchMinistriesParams> {
  final MasterDataRepository _repository;

  WatchMinistriesUseCase(this._repository);

  @override
  Stream<List<Ministry>> call(WatchMinistriesParams params) {
    return _repository.watchMinistries(query: params.query);
  }
}

class WatchMinistriesParams extends Equatable {
  final String? query;

  const WatchMinistriesParams({this.query});

  @override
  List<Object?> get props => [query];
}

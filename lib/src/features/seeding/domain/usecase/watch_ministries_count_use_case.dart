import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/seeding/domain/repository/seeding_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchMinistriesCountUseCase implements UseCase<Stream<int>, NoParams> {
  final SeedingRepository _repository;

  WatchMinistriesCountUseCase(this._repository);

  @override
  Stream<int> call(NoParams params) {
    return _repository.watchMinistriesCount();
  }
}

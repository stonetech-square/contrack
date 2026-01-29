import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/seeding/domain/repository/seeding_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchProjectsCountUseCase implements UseCase<Stream<int>, NoParams> {
  final SeedingRepository _repository;

  WatchProjectsCountUseCase(this._repository);

  @override
  Stream<int> call(NoParams params) {
    return _repository.watchProjectsCount();
  }
}

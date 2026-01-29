import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/seeding/domain/repository/seeding_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchUsersCountUseCase implements UseCase<Stream<int>, NoParams> {
  final SeedingRepository _repository;

  WatchUsersCountUseCase(this._repository);

  @override
  Stream<int> call(NoParams params) {
    return _repository.watchUsersCount();
  }
}

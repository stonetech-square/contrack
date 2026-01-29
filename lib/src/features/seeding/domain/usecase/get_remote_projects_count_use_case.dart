import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/seeding/domain/repository/seeding_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRemoteProjectsCountUseCase implements UseCase<Future<int>, NoParams> {
  final SeedingRepository _repository;

  GetRemoteProjectsCountUseCase(this._repository);

  @override
  Future<int> call(NoParams params) {
    return _repository.getRemoteProjectsCount();
  }
}

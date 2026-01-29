import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/seeding/domain/repository/seeding_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SeedMinistriesUseCase implements UseCase<Stream<double>, NoParams> {
  final SeedingRepository _repository;

  SeedMinistriesUseCase(this._repository);

  @override
  Stream<double> call(NoParams params) {
    return _repository.seedMinistries();
  }
}

import 'package:contrack/src/app/domain/repository/app_repository.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class SyncNowUseCase implements UseCase<Future<void>, NoParams> {
  final AppRepository _repository;

  SyncNowUseCase(this._repository);

  @override
  Future<void> call(NoParams params) => _repository.syncNow();
}

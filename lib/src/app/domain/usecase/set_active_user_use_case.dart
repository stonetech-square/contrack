import 'package:contrack/src/app/domain/repository/app_repository.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SetActiveUserUseCase implements UseCase<Future<void>, int> {
  final AppRepository _repository;

  SetActiveUserUseCase(this._repository);

  @override
  Future<void> call(int params) {
    return _repository.setUser(params);
  }
}

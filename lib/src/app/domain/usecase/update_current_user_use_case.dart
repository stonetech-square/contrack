import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/app/domain/repository/app_repository.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateCurrentUserUseCase implements UseCase<Future<void>, AppUserModel> {
  final AppRepository _repository;

  UpdateCurrentUserUseCase(this._repository);

  @override
  Future<void> call(AppUserModel user) {
    return _repository.updateUser(user);
  }
}

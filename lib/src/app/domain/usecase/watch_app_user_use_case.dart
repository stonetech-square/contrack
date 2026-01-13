import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/app/domain/repository/app_repository.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchAppUserUseCase implements UseCase<Stream<AppUserModel?>, NoParams> {
  final AppRepository _repository;

  WatchAppUserUseCase(this._repository);

  @override
  Stream<AppUserModel?> call(NoParams params) {
    return _repository.watchUser();
  }
}

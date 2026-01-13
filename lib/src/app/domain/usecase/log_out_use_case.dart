import 'package:contrack/src/app/domain/repository/app_repository.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LogOutUseCase implements UseCase<void, NoParams> {
  final AppRepository _appRepository;

  LogOutUseCase(this._appRepository);

  @override
  Future<void> call(NoParams params) async {
    await _appRepository.logOut();
  }
}

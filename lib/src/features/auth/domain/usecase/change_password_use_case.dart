import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangePasswordUseCase implements UseCase<Future<void>, String> {
  final AuthRepository _repository;

  ChangePasswordUseCase(this._repository);

  @override
  Future<void> call(String params) {
    return _repository.changePassword(params);
  }
}

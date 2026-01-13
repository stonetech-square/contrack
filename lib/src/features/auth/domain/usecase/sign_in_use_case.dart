import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});
}

@lazySingleton
class SignInUseCase implements UseCase<Future<void>, SignInParams> {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  @override
  Future<void> call(SignInParams params) {
    return _repository.signInWithCredentials(params.email, params.password);
  }
}

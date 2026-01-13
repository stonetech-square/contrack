import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

class VerifyOtpParams {
  final String email;
  final String otp;

  VerifyOtpParams({required this.email, required this.otp});
}

@lazySingleton
class VerifyOtpUseCase implements UseCase<Future<void>, VerifyOtpParams> {
  final AuthRepository _repository;

  VerifyOtpUseCase(this._repository);

  @override
  Future<void> call(VerifyOtpParams params) {
    return _repository.verifyOtp(params.email, params.otp);
  }
}

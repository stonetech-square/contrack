import 'package:formz/formz.dart';

enum RequiredIdValidationError { invalid }

class RequiredId extends FormzInput<int, RequiredIdValidationError> {
  const RequiredId.pure() : super.pure(0);
  const RequiredId.dirty([super.value = 0]) : super.dirty();

  @override
  RequiredIdValidationError? validator(int value) {
    return value > 0 ? null : RequiredIdValidationError.invalid;
  }
}

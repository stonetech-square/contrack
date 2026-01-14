import 'package:formz/formz.dart';

enum RequiredDateValidationError { empty }

class RequiredDate extends FormzInput<DateTime?, RequiredDateValidationError> {
  const RequiredDate.pure() : super.pure(null);
  const RequiredDate.dirty([super.value]) : super.dirty();

  @override
  RequiredDateValidationError? validator(DateTime? value) {
    return value != null ? null : RequiredDateValidationError.empty;
  }
}

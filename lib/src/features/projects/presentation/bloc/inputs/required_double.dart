import 'package:formz/formz.dart';

enum RequiredDoubleValidationError { invalid }

class RequiredDouble extends FormzInput<double, RequiredDoubleValidationError> {
  const RequiredDouble.pure() : super.pure(0.0);
  const RequiredDouble.dirty([super.value = 0.0]) : super.dirty();

  @override
  RequiredDoubleValidationError? validator(double value) {
    return value > 0 ? null : RequiredDoubleValidationError.invalid;
  }
}

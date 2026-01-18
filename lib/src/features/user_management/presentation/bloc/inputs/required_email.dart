import 'package:formz/formz.dart';

enum RequiredEmailValidationError { empty, invalid }

class RequiredEmail extends FormzInput<String, RequiredEmailValidationError> {
  const RequiredEmail.pure() : super.pure('');
  const RequiredEmail.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  RequiredEmailValidationError? validator(String value) {
    if (value.isEmpty) return RequiredEmailValidationError.empty;
    if (!_emailRegExp.hasMatch(value)) {
      return RequiredEmailValidationError.invalid;
    }
    return null;
  }
}

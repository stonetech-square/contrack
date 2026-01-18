import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:formz/formz.dart';

enum RequiredUserRoleValidationError { empty }

class RequiredUserRole
    extends FormzInput<UserRole?, RequiredUserRoleValidationError> {
  const RequiredUserRole.pure() : super.pure(null);
  const RequiredUserRole.dirty([super.value]) : super.dirty();

  @override
  RequiredUserRoleValidationError? validator(UserRole? value) {
    return value != null ? null : RequiredUserRoleValidationError.empty;
  }
}

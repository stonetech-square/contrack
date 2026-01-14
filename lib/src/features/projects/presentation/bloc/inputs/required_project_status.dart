import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:formz/formz.dart';

enum RequiredProjectStatusValidationError { invalid }

class RequiredProjectStatus
    extends FormzInput<ProjectStatus?, RequiredProjectStatusValidationError> {
  const RequiredProjectStatus.pure() : super.pure(null);
  const RequiredProjectStatus.dirty([super.value]) : super.dirty();

  @override
  RequiredProjectStatusValidationError? validator(ProjectStatus? value) {
    return value != null ? null : RequiredProjectStatusValidationError.invalid;
  }
}

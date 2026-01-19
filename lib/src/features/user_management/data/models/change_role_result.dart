
import 'package:contrack/src/core/common/enums/user_role.dart';

class ChangeRoleResult {
  final bool success;
  final UserRole role;

  ChangeRoleResult({required this.success, required this.role});
}
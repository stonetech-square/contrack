import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart';

abstract class UserManagementRepository {
  Stream<List<User>> watchUsers({String? searchQuery});
  Future<void> createUser({
    required String fullName,
    required String email,
    required String username,
    required UserRole role,
  });

  Future<void> toggleUserStatus(String userId);
  Future<void> changeUserRole(String userId, UserRole role);
  Future<void> resendInvitation(String userId);
}

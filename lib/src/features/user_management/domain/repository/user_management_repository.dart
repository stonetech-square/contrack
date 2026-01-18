import 'package:contrack/src/core/database/database.dart';

abstract class UserManagementRepository {
  Stream<List<User>> watchUsers({String? searchQuery});
  Future<void> createUser(User user);
  Future<void> updateUser(User user);
}

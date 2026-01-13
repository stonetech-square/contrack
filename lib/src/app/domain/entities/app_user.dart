import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  const AppUser({
    required this.id,
    required this.uid,
    required this.username,
    required this.fullName,
    required this.email,
    required this.role,
    required this.isActive,
    required this.createdAt,
    this.lastLoginAt,
  });

  final int id;
  final String uid;
  final String username;
  final String fullName;
  final String email;
  final UserRole role;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? lastLoginAt;

  AppUserModel toModel() {
    return AppUserModel(
      id: id,
      uid: uid,
      username: username,
      fullName: fullName,
      email: email,
      role: role,
      isActive: isActive,
      createdAt: createdAt,
      lastLoginAt: lastLoginAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    username,
    fullName,
    email,
    role,
    isActive,
    createdAt,
    lastLoginAt,
  ];
}

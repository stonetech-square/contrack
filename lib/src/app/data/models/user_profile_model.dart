import 'package:contrack/src/app/data/models/user_role_info.dart';
import 'package:contrack/src/app/domain/entities/app_user.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
sealed class UserProfileModel with _$UserProfileModel {
  const UserProfileModel._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserProfileModel({
    required String id,
    required String userName,
    required String fullName,
    required String email,
    required String? phone,
    required DateTime createdAt,
    DateTime? lastLoginAt,
    required List<UserRoleInfo> userRoles,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  UserRole get role =>
      userRoles.isNotEmpty ? userRoles.first.role : UserRole.regular;
  bool get isActive => userRoles.isNotEmpty ? userRoles.first.isActive : false;

  AppUser toAppUser() {
    return AppUser(
      id: 0,
      uid: id,
      username: userName,
      fullName: fullName,
      email: email,
      role: role,
      isActive: isActive,
      createdAt: createdAt,
      lastLoginAt: lastLoginAt,
    );
  }
}

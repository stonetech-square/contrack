import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user.freezed.dart';
part 'auth_user.g.dart';

@freezed
sealed class AuthUserModel with _$AuthUserModel {
  const AuthUserModel._();
  const factory AuthUserModel({
    required String uid,
    required String username,
    required String fullName,
    required String email,
    required UserRole role,
    required bool isActive,
    required DateTime createdAt,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
}

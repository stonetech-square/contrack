import 'package:contrack/src/app/domain/entities/app_user.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart' show User;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

@freezed
sealed class AppUserModel with _$AppUserModel {
  const AppUserModel._();

  const factory AppUserModel({
    required int id,
    required String uid,
    required String username,
    required String fullName,
    required String email,
    required UserRole role,
    required bool isActive,
    required DateTime createdAt,
    DateTime? lastLoginAt,
  }) = _AppUserModel;

  factory AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$AppUserModelFromJson(json);

  factory AppUserModel.fromDrift(User user) {
    return AppUserModel(
      id: user.id,
      uid: user.uid,
      username: user.username,
      fullName: user.fullName,
      email: user.email,
      role: user.role,
      isActive: user.isActive,
      createdAt: user.createdAt,
      lastLoginAt: user.lastLoginAt,
    );
  }

  AppUser toEntity() {
    return AppUser(
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
}

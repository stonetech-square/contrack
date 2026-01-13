import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_info.freezed.dart';
part 'user_role_info.g.dart';

@freezed
sealed class UserRoleInfo with _$UserRoleInfo {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserRoleInfo({
    required UserRole role,
    required bool isActive,
  }) = _UserRoleInfo;

  factory UserRoleInfo.fromJson(Map<String, dynamic> json) =>
      _$UserRoleInfoFromJson(json);
}

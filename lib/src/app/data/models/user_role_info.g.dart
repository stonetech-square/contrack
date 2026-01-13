// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserRoleInfo _$UserRoleInfoFromJson(Map<String, dynamic> json) =>
    _UserRoleInfo(
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$UserRoleInfoToJson(_UserRoleInfo instance) =>
    <String, dynamic>{
      'role': _$UserRoleEnumMap[instance.role]!,
      'is_active': instance.isActive,
    };

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'superAdmin',
  UserRole.admin: 'admin',
  UserRole.regular: 'regular',
};

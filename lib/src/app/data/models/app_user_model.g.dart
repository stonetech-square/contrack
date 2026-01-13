// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUserModel _$AppUserModelFromJson(Map<String, dynamic> json) =>
    _AppUserModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
    );

Map<String, dynamic> _$AppUserModelToJson(_AppUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'username': instance.username,
      'fullName': instance.fullName,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'superAdmin',
  UserRole.admin: 'admin',
  UserRole.regular: 'regular',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserModel _$AuthUserModelFromJson(Map<String, dynamic> json) =>
    _AuthUserModel(
      uid: json['uid'] as String,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      isActive: json['isActive'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$AuthUserModelToJson(_AuthUserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'fullName': instance.fullName,
      'email': instance.email,
      'role': _$UserRoleEnumMap[instance.role]!,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$UserRoleEnumMap = {
  UserRole.superAdmin: 'superAdmin',
  UserRole.admin: 'admin',
  UserRole.regular: 'regular',
};

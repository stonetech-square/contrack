// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      id: json['id'] as String,
      userName: json['user_name'] as String,
      fullName: json['full_name'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      lastLoginAt: json['last_login_at'] == null
          ? null
          : DateTime.parse(json['last_login_at'] as String),
      userRoles: (json['user_roles'] as List<dynamic>)
          .map((e) => UserRoleInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'created_at': instance.createdAt.toIso8601String(),
      'last_login_at': instance.lastLoginAt?.toIso8601String(),
      'user_roles': instance.userRoles,
    };

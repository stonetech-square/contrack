// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_ministry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeedMinistryModel _$SeedMinistryModelFromJson(Map<String, dynamic> json) =>
    _SeedMinistryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SeedMinistryModelToJson(_SeedMinistryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

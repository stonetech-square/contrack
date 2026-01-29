// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_agency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeedAgencyModel _$SeedAgencyModelFromJson(Map<String, dynamic> json) =>
    _SeedAgencyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      ministryId: json['ministry_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SeedAgencyModelToJson(_SeedAgencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'ministry_id': instance.ministryId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

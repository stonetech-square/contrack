// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seed_project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeedProjectModel _$SeedProjectModelFromJson(
  Map<String, dynamic> json,
) => _SeedProjectModel(
  id: json['id'] as String,
  code: json['code'] as String,
  projectStatus: $enumDecode(_$ProjectStatusEnumMap, json['project_status']),
  inHouseStatus:
      $enumDecodeNullable(_$InHouseStatusEnumMap, json['in_house_status']) ??
      InHouseStatus.notStarted,
  agencyId: json['agency_id'] as String,
  ministryId: json['ministry_id'] as String,
  stateId: json['state_id'] as String,
  zoneId: json['zone_id'] as String,
  title: json['title'] as String,
  amount: (json['amount'] as num).toDouble(),
  constituency: json['constituency'] as String,
  sponsor: json['sponsor'] as String?,
  createdBy: json['created_by'] as String,
  modifiedBy: json['modified_by'] as String?,
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
  endDate: json['end_date'] == null
      ? null
      : DateTime.parse(json['end_date'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$SeedProjectModelToJson(_SeedProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'project_status': _$ProjectStatusEnumMap[instance.projectStatus]!,
      'in_house_status': _$InHouseStatusEnumMap[instance.inHouseStatus]!,
      'agency_id': instance.agencyId,
      'ministry_id': instance.ministryId,
      'state_id': instance.stateId,
      'zone_id': instance.zoneId,
      'title': instance.title,
      'amount': instance.amount,
      'constituency': instance.constituency,
      'sponsor': instance.sponsor,
      'created_by': instance.createdBy,
      'modified_by': instance.modifiedBy,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$ProjectStatusEnumMap = {
  ProjectStatus.newProject: 'new',
  ProjectStatus.ongoing: 'ongoing',
};

const _$InHouseStatusEnumMap = {
  InHouseStatus.notStarted: 'notStarted',
  InHouseStatus.ongoing: 'ongoing',
  InHouseStatus.completed: 'completed',
  InHouseStatus.suspended: 'suspended',
  InHouseStatus.cancelled: 'cancelled',
};

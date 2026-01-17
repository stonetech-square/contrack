// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_with_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectWithDetailsModel _$ProjectWithDetailsModelFromJson(
  Map<String, dynamic> json,
) => _ProjectWithDetailsModel(
  code: json['code'] as String,
  status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
  agencyId: (json['agency_id'] as num).toInt(),
  agencyName: json['agency_name'] as String,
  ministryId: (json['ministry_id'] as num).toInt(),
  ministryName: json['ministry_name'] as String,
  stateId: (json['state_id'] as num).toInt(),
  stateName: json['state_name'] as String,
  zoneId: (json['zone_id'] as num).toInt(),
  zoneName: json['zone_name'] as String,
  title: json['title'] as String,
  amount: (json['amount'] as num).toDouble(),
  constituency: json['constituency'] as String,
  sponsor: json['sponsor'] as String?,
  createdBy: (json['created_by'] as num).toInt(),
  createdByName: json['created_by_name'] as String?,
  modifiedBy: (json['modified_by'] as num?)?.toInt(),
  modifiedByName: json['modified_by_name'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  isSynced: json['is_synced'] as bool? ?? false,
  lastSyncedAt: json['last_synced_at'] == null
      ? null
      : DateTime.parse(json['last_synced_at'] as String),
  remoteId: json['remote_id'] as String?,
);

Map<String, dynamic> _$ProjectWithDetailsModelToJson(
  _ProjectWithDetailsModel instance,
) => <String, dynamic>{
  'code': instance.code,
  'status': _$ProjectStatusEnumMap[instance.status]!,
  'agency_id': instance.agencyId,
  'agency_name': instance.agencyName,
  'ministry_id': instance.ministryId,
  'ministry_name': instance.ministryName,
  'state_id': instance.stateId,
  'state_name': instance.stateName,
  'zone_id': instance.zoneId,
  'zone_name': instance.zoneName,
  'title': instance.title,
  'amount': instance.amount,
  'constituency': instance.constituency,
  'sponsor': instance.sponsor,
  'created_by': instance.createdBy,
  'created_by_name': instance.createdByName,
  'modified_by': instance.modifiedBy,
  'modified_by_name': instance.modifiedByName,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'is_synced': instance.isSynced,
  'last_synced_at': instance.lastSyncedAt?.toIso8601String(),
  'remote_id': instance.remoteId,
};

const _$ProjectStatusEnumMap = {
  ProjectStatus.notStarted: 'notStarted',
  ProjectStatus.ongoing: 'ongoing',
  ProjectStatus.completed: 'completed',
  ProjectStatus.suspended: 'suspended',
  ProjectStatus.cancelled: 'cancelled',
};

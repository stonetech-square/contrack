// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProjectModel _$ProjectModelFromJson(Map<String, dynamic> json) =>
    _ProjectModel(
      code: json['code'] as String,
      status: $enumDecode(_$ProjectStatusEnumMap, json['status']),
      agencyId: (json['agency_id'] as num).toInt(),
      ministryId: (json['ministry_id'] as num).toInt(),
      stateId: (json['state_id'] as num).toInt(),
      zoneId: (json['zone_id'] as num).toInt(),
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      constituency: json['constituency'] as String,
      sponsor: json['sponsor'] as String?,
      createdBy: json['created_by'] as String,
      modifiedBy: json['modified_by'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      isSynced: json['is_synced'] as bool? ?? false,
      lastSyncedAt: json['last_synced_at'] == null
          ? null
          : DateTime.parse(json['last_synced_at'] as String),
      remoteId: json['remote_id'] as String?,
    );

Map<String, dynamic> _$ProjectModelToJson(_ProjectModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': _$ProjectStatusEnumMap[instance.status]!,
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

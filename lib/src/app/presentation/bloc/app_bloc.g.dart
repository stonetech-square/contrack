// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppState _$AppStateFromJson(Map<String, dynamic> json) => _AppState(
  themeMode: (json['themeMode'] as num?)?.toInt() ?? 0,
  user: json['user'] == null
      ? null
      : AppUserModel.fromJson(json['user'] as Map<String, dynamic>),
  error: json['error'] as String?,
  syncStatus:
      $enumDecodeNullable(_$AppSyncStatusEnumMap, json['syncStatus']) ??
      AppSyncStatus.offline,
  isSeeding: json['isSeeding'] as bool? ?? false,
);

Map<String, dynamic> _$AppStateToJson(_AppState instance) => <String, dynamic>{
  'themeMode': instance.themeMode,
  'user': instance.user,
  'error': instance.error,
  'syncStatus': _$AppSyncStatusEnumMap[instance.syncStatus]!,
  'isSeeding': instance.isSeeding,
};

const _$AppSyncStatusEnumMap = {
  AppSyncStatus.online: 'online',
  AppSyncStatus.offline: 'offline',
  AppSyncStatus.syncing: 'syncing',
};

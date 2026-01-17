import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:equatable/equatable.dart';

/// Project entity enriched with related entity names from JOINs
class ProjectWithDetails extends Equatable {
  final String code;
  final ProjectStatus status;
  final int agencyId;
  final String agencyName;
  final int ministryId;
  final String ministryName;
  final int stateId;
  final String stateName;
  final int zoneId;
  final String zoneName;
  final String constituency;
  final double amount;
  final String? sponsor;
  final String title;
  final int createdBy;
  final int? modifiedBy;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isSynced;
  final DateTime? lastSyncedAt;
  final String? remoteId;

  const ProjectWithDetails({
    required this.code,
    required this.status,
    required this.agencyId,
    required this.agencyName,
    required this.ministryId,
    required this.ministryName,
    required this.stateId,
    required this.stateName,
    required this.zoneId,
    required this.zoneName,
    required this.constituency,
    required this.amount,
    this.sponsor,
    required this.title,
    required this.createdBy,
    this.modifiedBy,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
    this.lastSyncedAt,
    this.remoteId,
  });

  @override
  List<Object?> get props => [
    code,
    status,
    agencyId,
    agencyName,
    ministryId,
    ministryName,
    stateId,
    stateName,
    zoneId,
    zoneName,
    constituency,
    amount,
    sponsor,
    title,
    createdBy,
    modifiedBy,
    createdAt,
    updatedAt,
    isSynced,
    lastSyncedAt,
    remoteId,
  ];
}

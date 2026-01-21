import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
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
  final String createdBy;
  final String? createdByName;
  final String? modifiedBy;
  final String? modifiedByName;
  final DateTime? startDate;
  final DateTime? endDate;
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
    this.createdByName,
    this.modifiedBy,
    this.modifiedByName,
    this.startDate,
    this.endDate,
    required this.createdAt,
    required this.updatedAt,
    required this.isSynced,
    this.lastSyncedAt,
    this.remoteId,
  });

  Project toProject() {
    return Project(
      code: code,
      status: status,
      agencyId: agencyId,
      ministryId: ministryId,
      stateId: stateId,
      zoneId: zoneId,
      constituency: constituency,
      amount: amount,
      sponsor: sponsor,
      title: title,
      createdBy: createdBy,
      modifiedBy: modifiedBy,
      startDate: startDate,
      endDate: endDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isSynced: isSynced,
      lastSyncedAt: lastSyncedAt,
      remoteId: remoteId,
    );
  }

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
    createdByName,
    modifiedBy,
    modifiedByName,
    startDate,
    endDate,
    createdAt,
    updatedAt,
    isSynced,
    lastSyncedAt,
    remoteId,
  ];
}

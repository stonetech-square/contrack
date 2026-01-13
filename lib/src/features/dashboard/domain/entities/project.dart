import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final int id;
  final String code;
  final ProjectStatus status;
  final int agencyId;
  final int ministryId;
  final int stateId;
  final int zoneId;
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

  const Project({
    required this.id,
    required this.code,
    required this.status,
    required this.agencyId,
    required this.ministryId,
    required this.stateId,
    required this.zoneId,
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
    id,
    code,
    status,
    agencyId,
    ministryId,
    stateId,
    zoneId,
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

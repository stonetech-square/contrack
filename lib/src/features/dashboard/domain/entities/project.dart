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

  factory Project.empty(String code) {
    return Project(
      id: 0,
      code: code,
      status: ProjectStatus.notStarted,
      agencyId: 0,
      ministryId: 0,
      stateId: 0,
      zoneId: 0,
      constituency: '',
      amount: 0,
      title: '',
      createdBy: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isSynced: false,
    );
  }

  Project copyWith({
    int? id,
    String? code,
    ProjectStatus? status,
    int? agencyId,
    int? ministryId,
    int? stateId,
    int? zoneId,
    String? constituency,
    double? amount,
    String? sponsor,
    String? title,
    int? createdBy,
    int? modifiedBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isSynced,
    DateTime? lastSyncedAt,
    String? remoteId,
  }) {
    return Project(
      id: id ?? this.id,
      code: code ?? this.code,
      status: status ?? this.status,
      agencyId: agencyId ?? this.agencyId,
      ministryId: ministryId ?? this.ministryId,
      stateId: stateId ?? this.stateId,
      zoneId: zoneId ?? this.zoneId,
      constituency: constituency ?? this.constituency,
      amount: amount ?? this.amount,
      sponsor: sponsor ?? this.sponsor,
      title: title ?? this.title,
      createdBy: createdBy ?? this.createdBy,
      modifiedBy: modifiedBy ?? this.modifiedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isSynced: isSynced ?? this.isSynced,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
      remoteId: remoteId ?? this.remoteId,
    );
  }

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

import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart'
    as entity;
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:drift/drift.dart' hide JsonKey;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
sealed class ProjectModel with _$ProjectModel {
  const ProjectModel._();
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProjectModel({
    required int id,
    required String code,
    required ProjectStatus status,
    required int agencyId,
    required int ministryId,
    required int stateId,
    required int zoneId,
    required String title,
    required double amount,
    required String constituency,
    String? sponsor,
    required int createdBy,
    int? modifiedBy,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
    DateTime? lastSyncedAt,
    String? remoteId,
  }) = _ProjectModel;

  factory ProjectModel.fromDrift(Project driftProject) {
    return ProjectModel(
      id: driftProject.id,
      code: driftProject.code,
      status: driftProject.status,
      agencyId: driftProject.agencyId,
      ministryId: driftProject.ministryId,
      stateId: driftProject.stateId,
      zoneId: driftProject.zoneId,
      constituency: driftProject.constituency,
      amount: driftProject.amount,
      sponsor: driftProject.sponsor,
      title: driftProject.title,
      createdBy: driftProject.createdBy,
      modifiedBy: driftProject.modifiedBy,
      createdAt: driftProject.createdAt,
      updatedAt: driftProject.updatedAt,
      isSynced: driftProject.isSynced,
      lastSyncedAt: driftProject.lastSyncedAt,
      remoteId: driftProject.remoteId,
    );
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  entity.Project toEntity() {
    return entity.Project(
      id: id,
      code: code,
      status: status,
      agencyId: agencyId,
      ministryId: ministryId,
      stateId: stateId,
      zoneId: zoneId,
      createdBy: createdBy,
      modifiedBy: modifiedBy,
      createdAt: createdAt,
      constituency: constituency,
      amount: amount,
      sponsor: sponsor,
      title: title,
      updatedAt: updatedAt,
      isSynced: isSynced,
      lastSyncedAt: lastSyncedAt,
      remoteId: remoteId,
    );
  }

  static ProjectModel fromEntity(entity.Project project) {
    return ProjectModel(
      id: project.id,
      code: project.code,
      status: project.status,
      agencyId: project.agencyId,
      ministryId: project.ministryId,
      stateId: project.stateId,
      zoneId: project.zoneId,
      constituency: project.constituency,
      amount: project.amount,
      sponsor: project.sponsor,
      title: project.title,
      createdBy: project.createdBy,
      modifiedBy: project.modifiedBy,
      createdAt: project.createdAt,
      updatedAt: project.updatedAt,
      isSynced: project.isSynced,
      lastSyncedAt: project.lastSyncedAt,
      remoteId: project.remoteId,
    );
  }

  ProjectsCompanion toDriftCompanion() {
    return ProjectsCompanion(
      id: id <= 0 ? const Value.absent() : Value(id),
      code: Value(code),
      status: Value(status),
      agencyId: Value(agencyId),
      ministryId: Value(ministryId),
      stateId: Value(stateId),
      zoneId: Value(zoneId),
      title: Value(title),
      amount: Value(amount),
      constituency: Value(constituency),
      sponsor: Value(sponsor),
      createdBy: Value(createdBy),
      modifiedBy: Value(modifiedBy),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      lastSyncedAt: Value(lastSyncedAt),
      remoteId: Value(remoteId),
    );
  }
}

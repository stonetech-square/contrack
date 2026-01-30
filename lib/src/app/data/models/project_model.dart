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
    required String code,
    required ProjectStatus projectStatus,
    @Default(InHouseStatus.notStarted) InHouseStatus inHouseStatus,
    required int agencyId,
    required int ministryId,
    required int stateId,
    required int zoneId,
    required String title,
    required double amount,
    required String constituency,
    String? sponsor,
    required String createdBy,
    String? modifiedBy,
    DateTime? startDate,
    DateTime? endDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
    DateTime? lastSyncedAt,
    String? remoteId,
  }) = _ProjectModel;

  factory ProjectModel.fromDrift(Project driftProject) {
    return ProjectModel(
      code: driftProject.code,
      projectStatus: driftProject.projectStatus,
      inHouseStatus: driftProject.inHouseStatus,
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
      startDate: driftProject.startDate,
      endDate: driftProject.endDate,
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
      code: code,
      projectStatus: projectStatus,
      inHouseStatus: inHouseStatus,
      agencyId: agencyId,
      ministryId: ministryId,
      stateId: stateId,
      zoneId: zoneId,
      createdBy: createdBy,
      modifiedBy: modifiedBy,
      startDate: startDate,
      endDate: endDate,
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
      code: project.code,
      projectStatus: project.projectStatus,
      inHouseStatus: project.inHouseStatus,
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
      startDate: project.startDate,
      endDate: project.endDate,
      createdAt: project.createdAt,
      updatedAt: project.updatedAt,
      isSynced: project.isSynced,
      lastSyncedAt: project.lastSyncedAt,
      remoteId: project.remoteId,
    );
  }

  ProjectsCompanion toDriftCompanion() {
    return ProjectsCompanion(
      code: Value(code),
      projectStatus: Value(projectStatus),
      inHouseStatus: Value(inHouseStatus),
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
      startDate: Value(startDate),
      endDate: Value(endDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      isSynced: Value(isSynced),
      lastSyncedAt: Value(lastSyncedAt),
      remoteId: Value(remoteId),
    );
  }
}

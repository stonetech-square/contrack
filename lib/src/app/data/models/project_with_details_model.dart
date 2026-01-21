import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_with_details_model.freezed.dart';
part 'project_with_details_model.g.dart';

@freezed
sealed class ProjectWithDetailsModel with _$ProjectWithDetailsModel {
  const ProjectWithDetailsModel._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ProjectWithDetailsModel({
    required String code,
    required ProjectStatus status,
    required int agencyId,
    required String agencyName,
    required int ministryId,
    required String ministryName,
    required int stateId,
    required String stateName,
    required int zoneId,
    required String zoneName,
    required String title,
    required double amount,
    required String constituency,
    String? sponsor,
    required String createdBy,
    String? createdByName,
    String? modifiedBy,
    String? modifiedByName,
    DateTime? startDate,
    DateTime? endDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isSynced,
    DateTime? lastSyncedAt,
    String? remoteId,
  }) = _ProjectWithDetailsModel;

  factory ProjectWithDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectWithDetailsModelFromJson(json);

  ProjectWithDetails toEntity() {
    return ProjectWithDetails(
      code: code,
      status: status,
      agencyId: agencyId,
      agencyName: agencyName,
      ministryId: ministryId,
      ministryName: ministryName,
      stateId: stateId,
      stateName: stateName,
      zoneId: zoneId,
      zoneName: zoneName,
      createdBy: createdBy,
      createdByName: createdByName,
      modifiedBy: modifiedBy,
      modifiedByName: modifiedByName,
      createdAt: createdAt,
      constituency: constituency,
      amount: amount,
      sponsor: sponsor,
      title: title,
      startDate: startDate,
      endDate: endDate,
      updatedAt: updatedAt,
      isSynced: isSynced,
      lastSyncedAt: lastSyncedAt,
      remoteId: remoteId,
    );
  }
}

import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed_project_model.freezed.dart';
part 'seed_project_model.g.dart';

@freezed
sealed class SeedProjectModel with _$SeedProjectModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SeedProjectModel({
    required String id,
    required String code,
    required ProjectStatus status,
    required String agencyId,
    required String ministryId,
    required String stateId,
    required String zoneId,
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
  }) = _SeedProjectModel;

  factory SeedProjectModel.fromJson(Map<String, dynamic> json) =>
      _$SeedProjectModelFromJson(json);
}

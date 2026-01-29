import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed_agency_model.freezed.dart';
part 'seed_agency_model.g.dart';

@freezed
sealed class SeedAgencyModel with _$SeedAgencyModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SeedAgencyModel({
    required String id,
    required String name,
    required String code,
    required String ministryId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SeedAgencyModel;

  factory SeedAgencyModel.fromJson(Map<String, dynamic> json) =>
      _$SeedAgencyModelFromJson(json);
}

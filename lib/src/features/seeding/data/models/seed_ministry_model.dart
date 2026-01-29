import 'package:freezed_annotation/freezed_annotation.dart';

part 'seed_ministry_model.freezed.dart';
part 'seed_ministry_model.g.dart';

@freezed
sealed class SeedMinistryModel with _$SeedMinistryModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SeedMinistryModel({
    required String id,
    required String name,
    required String code,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SeedMinistryModel;

  factory SeedMinistryModel.fromJson(Map<String, dynamic> json) =>
      _$SeedMinistryModelFromJson(json);
}

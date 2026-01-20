import 'package:contrack/src/core/database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agency_with_ministry.freezed.dart';

@freezed
sealed class AgencyWithMinistry with _$AgencyWithMinistry {
  const factory AgencyWithMinistry({
    required Agency agency,
    required Ministry ministry,
  }) = _AgencyWithMinistry;
}

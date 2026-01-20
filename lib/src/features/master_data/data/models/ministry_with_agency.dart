import 'package:contrack/src/core/database/database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ministry_with_agency.freezed.dart';

@freezed
sealed class MinistryWithAgency with _$MinistryWithAgency {
  const factory MinistryWithAgency({
    required Ministry ministry,
    required Agency agency,
  }) = _MinistryWithAgency;
}

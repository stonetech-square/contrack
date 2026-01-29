import 'package:freezed_annotation/freezed_annotation.dart';

part 'seeding_state.freezed.dart';

@freezed
class SeedingState with _$SeedingState {
  const factory SeedingState.initial() = _Initial;
  const factory SeedingState.inProgress({
    @Default(0.0) double usersProgress,
    @Default(0.0) double ministriesProgress,
    @Default(0.0) double agenciesProgress,
    @Default(0.0) double projectsProgress,
    required String currentStep,
  }) = _InProgress;
  const factory SeedingState.success() = _Success;
  const factory SeedingState.failure(String message) = _Failure;
}

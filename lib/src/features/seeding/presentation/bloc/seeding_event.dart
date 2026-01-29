import 'package:freezed_annotation/freezed_annotation.dart';

part 'seeding_event.freezed.dart';

@freezed
class SeedingEvent with _$SeedingEvent {
  const factory SeedingEvent.startSeeding() = _StartSeeding;
}

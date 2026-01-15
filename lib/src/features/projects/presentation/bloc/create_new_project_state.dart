part of 'create_new_project_bloc.dart';

enum CreateProjectViewStatus {
  initial,
  filling,
  submitting,
  success,
  failure,
  cancelled,
}

@freezed
sealed class CreateNewProjectState with _$CreateNewProjectState {
  const factory CreateNewProjectState({
    @Default(CreateProjectViewStatus.initial)
    CreateProjectViewStatus viewStatus,
    @Default('') String errorMessage,
    @Default('') String projectCode,
    @Default(RequiredProjectStatus.pure()) RequiredProjectStatus status,
    @Default(RequiredId.pure()) RequiredId implementingAgencyId,
    @Default(RequiredId.pure()) RequiredId supervisingMinistryId,
    @Default(RequiredId.pure()) RequiredId stateId,
    @Default(RequiredId.pure()) RequiredId geopoliticalZoneId,
    @Default(RequiredText.pure()) RequiredText constituency,
    @Default(RequiredText.pure()) RequiredText title,
    @Default('') String sponsor,
    @Default(RequiredDouble.pure()) RequiredDouble budget,
    @Default(RequiredDate.pure()) RequiredDate startDate,
    @Default(RequiredDate.pure()) RequiredDate endDate,
    @Default(false) bool showErrors,
    @Default([]) List<ImplementingAgency> agencies,
    @Default([]) List<SupervisingMinistry> ministries,
    @Default([]) List<GeopoliticalZone> zones,
    @Default([]) List<NigerianState> states,
  }) = _CreateNewProjectState;

  const CreateNewProjectState._();

  bool get isValid => Formz.validate([
    status,
    implementingAgencyId,
    supervisingMinistryId,
    stateId,
    geopoliticalZoneId,
    constituency,
    title,
    budget,
    startDate,
    endDate,
  ]);
}

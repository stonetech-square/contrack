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
sealed class ProjectEntryFormData with _$ProjectEntryFormData {
  const factory ProjectEntryFormData({
    required String code,
    @Default(RequiredProjectStatus.pure()) RequiredProjectStatus status,
    @Default(RequiredId.pure()) RequiredId supervisingMinistryId,
    @Default(RequiredId.pure()) RequiredId implementingAgencyId,
    @Default(RequiredId.pure()) RequiredId stateId,
    @Default(RequiredId.pure()) RequiredId geopoliticalZoneId,
    @Default(RequiredText.pure()) RequiredText constituency,
    @Default(RequiredText.pure()) RequiredText title,
    @Default('') String sponsor,
    @Default(RequiredDouble.pure()) RequiredDouble budget,
    @Default(RequiredDate.pure()) RequiredDate startDate,
    @Default(RequiredDate.pure()) RequiredDate endDate,
    @Default(InHouseStatus.notStarted) InHouseStatus inHouseStatus,
    @Default([]) List<ImplementingAgency> agencies,
    @Default([]) List<NigerianState> states,
    // Preserved fields for editing existing projects
    String? remoteId,
    String? createdBy,
    DateTime? createdAt,
  }) = _ProjectEntryFormData;

  const ProjectEntryFormData._();

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

  Project toProject() => Project(
    code: code,
    projectStatus: status.value ?? ProjectStatus.newProject,
    inHouseStatus: inHouseStatus,
    agencyId: implementingAgencyId.value,
    ministryId: supervisingMinistryId.value,
    stateId: stateId.value,
    zoneId: geopoliticalZoneId.value,
    constituency: constituency.value,
    amount: budget.value,
    sponsor: sponsor.isEmpty ? null : sponsor,
    title: title.value,
    createdBy: createdBy ?? '',
    createdAt: createdAt ?? DateTime.now(),
    updatedAt: DateTime.now(),
    isSynced: false,
    startDate: startDate.value,
    endDate: endDate.value,
    remoteId: remoteId,
  );
}

@freezed
sealed class CreateNewProjectState with _$CreateNewProjectState {
  const factory CreateNewProjectState({
    @Default(CreateProjectViewStatus.initial)
    CreateProjectViewStatus viewStatus,
    @Default('') String errorMessage,
    @Default([]) List<ProjectEntryFormData> entries,
    @Default(0) int currentEntryIndex,
    @Default(false) bool showErrors,
    @Default([]) List<SupervisingMinistry> ministries,
    @Default([]) List<GeopoliticalZone> zones,
  }) = _CreateNewProjectState;

  const CreateNewProjectState._();

  ProjectEntryFormData? get currentEntry =>
      entries.isNotEmpty && currentEntryIndex < entries.length
      ? entries[currentEntryIndex]
      : null;

  bool get isValid =>
      entries.isNotEmpty && entries.every((entry) => entry.isValid);
}

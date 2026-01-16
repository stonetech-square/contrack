import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/projects/domain/entities/geopolitical_zone.dart';
import 'package:contrack/src/features/projects/domain/entities/implementing_agency.dart';
import 'package:contrack/src/features/projects/domain/entities/nigerian_state.dart';
import 'package:contrack/src/features/projects/domain/entities/supervising_ministry.dart';
import 'package:contrack/src/features/projects/domain/usecase/create_project_use_case.dart';
import 'package:contrack/src/features/projects/domain/usecase/generate_project_code_use_case.dart';
import 'package:contrack/src/features/projects/domain/usecase/get_geopolitical_zones_use_case.dart';
import 'package:contrack/src/features/projects/domain/usecase/get_implementing_agencies_use_case.dart';
import 'package:contrack/src/features/projects/domain/usecase/get_states_use_case.dart';
import 'package:contrack/src/features/projects/domain/usecase/get_supervising_ministries_use_case.dart';
import 'package:contrack/src/features/projects/presentation/bloc/inputs/inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_new_project_event.dart';
part 'create_new_project_state.dart';
part 'create_new_project_bloc.freezed.dart';

@injectable
class CreateNewProjectBloc
    extends Bloc<CreateNewProjectEvent, CreateNewProjectState> {
  final GenerateProjectCodeUseCase _generateProjectCodeUseCase;
  final CreateProjectUseCase _createProjectUseCase;
  final GetGeopoliticalZonesUseCase _getGeopoliticalZonesUseCase;
  final GetImplementingAgenciesUseCase _getImplementingAgenciesUseCase;
  final GetStatesUseCase _getStatesUseCase;
  final GetSupervisingMinistriesUseCase _getSupervisingMinistriesUseCase;

  CreateNewProjectBloc(
    this._generateProjectCodeUseCase,
    this._createProjectUseCase,
    this._getGeopoliticalZonesUseCase,
    this._getImplementingAgenciesUseCase,
    this._getStatesUseCase,
    this._getSupervisingMinistriesUseCase,
  ) : super(const CreateNewProjectState()) {
    on<CreateNewProjectStarted>(_onStarted);
    on<EntryAdded>(_onEntryAdded);
    on<EntryRemoved>(_onEntryRemoved);
    on<EntrySelected>(_onEntrySelected);
    on<EntryFieldChanged>(_onEntryFieldChanged);
    on<CreateNewProjectSubmitted>(_onSubmitted);
    on<CreateNewProjectCancelled>(_onCancelled);
  }

  Future<void> _onStarted(
    CreateNewProjectStarted event,
    Emitter<CreateNewProjectState> emit,
  ) async {
    try {
      final zones = await _getGeopoliticalZonesUseCase(NoParams());
      final agencies = await _getImplementingAgenciesUseCase(NoParams());

      final entries = event.projects != null
          ? await _projectsToEntries(event.projects!)
          : [_createEmptyEntry()];

      emit(
        state.copyWith(
          entries: entries,
          zones: zones,
          agencies: agencies,
          viewStatus: CreateProjectViewStatus.filling,
        ),
      );
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(
        state.copyWith(
          viewStatus: CreateProjectViewStatus.failure,
          errorMessage: failure.message,
        ),
      );
    }
  }

  Future<List<ProjectEntryFormData>> _projectsToEntries(
    List<Project> projects,
  ) async {
    final entries = <ProjectEntryFormData>[];
    for (final project in projects) {
      final ministries = project.agencyId > 0
          ? await _getSupervisingMinistriesUseCase(project.agencyId)
          : <SupervisingMinistry>[];
      final states = project.zoneId > 0
          ? await _getStatesUseCase(project.zoneId)
          : <NigerianState>[];

      entries.add(
        ProjectEntryFormData(
          code: project.code,
          status: RequiredProjectStatus.dirty(project.status),
          implementingAgencyId: RequiredId.dirty(project.agencyId),
          supervisingMinistryId: RequiredId.dirty(project.ministryId),
          geopoliticalZoneId: RequiredId.dirty(project.zoneId),
          stateId: RequiredId.dirty(project.stateId),
          constituency: RequiredText.dirty(project.constituency),
          title: RequiredText.dirty(project.title),
          sponsor: project.sponsor ?? '',
          budget: RequiredDouble.dirty(project.amount),
          startDate: const RequiredDate.pure(),
          endDate: const RequiredDate.pure(),
          ministries: ministries,
          states: states,
        ),
      );
    }
    return entries;
  }

  ProjectEntryFormData _createEmptyEntry() {
    final code = _generateProjectCodeUseCase(GenerateProjectCodeParams());
    return ProjectEntryFormData(code: code);
  }

  void _onEntryAdded(EntryAdded event, Emitter<CreateNewProjectState> emit) {
    final newEntry = _createEmptyEntry();
    final updatedEntries = [...state.entries, newEntry];
    emit(
      state.copyWith(
        entries: updatedEntries,
        currentEntryIndex: updatedEntries.length - 1,
      ),
    );
  }

  void _onEntryRemoved(
    EntryRemoved event,
    Emitter<CreateNewProjectState> emit,
  ) {
    if (state.entries.length <= 1) return;

    final updatedEntries = [...state.entries]..removeAt(event.index);
    final newIndex = state.currentEntryIndex >= updatedEntries.length
        ? updatedEntries.length - 1
        : state.currentEntryIndex;

    emit(state.copyWith(entries: updatedEntries, currentEntryIndex: newIndex));
  }

  void _onEntrySelected(
    EntrySelected event,
    Emitter<CreateNewProjectState> emit,
  ) {
    if (event.index < 0 || event.index >= state.entries.length) return;
    emit(state.copyWith(currentEntryIndex: event.index));
  }

  Future<void> _onEntryFieldChanged(
    EntryFieldChanged event,
    Emitter<CreateNewProjectState> emit,
  ) async {
    if (event.index < 0 || event.index >= state.entries.length) return;

    var entry = state.entries[event.index];

    if (event.status != null) {
      entry = entry.copyWith(status: RequiredProjectStatus.dirty(event.status));
    }

    if (event.implementingAgencyId != null) {
      entry = entry.copyWith(
        implementingAgencyId: RequiredId.dirty(event.implementingAgencyId!),
        supervisingMinistryId: const RequiredId.pure(),
        ministries: [],
      );
      _emitUpdatedEntry(emit, event.index, entry);

      final ministries = await _getSupervisingMinistriesUseCase(
        event.implementingAgencyId!,
      );
      entry = state.entries[event.index].copyWith(ministries: ministries);
      _emitUpdatedEntry(emit, event.index, entry);
      return;
    }

    if (event.supervisingMinistryId != null) {
      entry = entry.copyWith(
        supervisingMinistryId: RequiredId.dirty(event.supervisingMinistryId!),
      );
    }

    if (event.geopoliticalZoneId != null) {
      entry = entry.copyWith(
        geopoliticalZoneId: RequiredId.dirty(event.geopoliticalZoneId!),
        stateId: const RequiredId.pure(),
        states: [],
      );
      _emitUpdatedEntry(emit, event.index, entry);

      final states = await _getStatesUseCase(event.geopoliticalZoneId!);
      entry = state.entries[event.index].copyWith(states: states);
      _emitUpdatedEntry(emit, event.index, entry);
      return;
    }

    if (event.stateId != null) {
      entry = entry.copyWith(stateId: RequiredId.dirty(event.stateId!));
    }

    if (event.constituency != null) {
      entry = entry.copyWith(
        constituency: RequiredText.dirty(event.constituency!),
      );
    }

    if (event.title != null) {
      entry = entry.copyWith(title: RequiredText.dirty(event.title!));
    }

    if (event.sponsor != null) {
      entry = entry.copyWith(sponsor: event.sponsor!);
    }

    if (event.budget != null) {
      entry = entry.copyWith(budget: RequiredDouble.dirty(event.budget!));
    }

    if (event.startDate != null) {
      entry = entry.copyWith(startDate: RequiredDate.dirty(event.startDate!));
    }

    if (event.endDate != null) {
      entry = entry.copyWith(endDate: RequiredDate.dirty(event.endDate!));
    }

    _emitUpdatedEntry(emit, event.index, entry);
  }

  void _emitUpdatedEntry(
    Emitter<CreateNewProjectState> emit,
    int index,
    ProjectEntryFormData entry,
  ) {
    final updatedEntries = [...state.entries]..[index] = entry;
    emit(state.copyWith(entries: updatedEntries));
  }

  Future<void> _onSubmitted(
    CreateNewProjectSubmitted event,
    Emitter<CreateNewProjectState> emit,
  ) async {
    if (!state.isValid) {
      emit(state.copyWith(showErrors: true));
      return;
    }

    emit(
      state.copyWith(
        viewStatus: CreateProjectViewStatus.submitting,
        showErrors: false,
      ),
    );

    try {
      final projects = state.entries.map((e) => e.toProject(0)).toList();
      await _createProjectUseCase(CreateProjectParams(projects: projects));
      emit(state.copyWith(viewStatus: CreateProjectViewStatus.success));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(
        state.copyWith(
          viewStatus: CreateProjectViewStatus.failure,
          errorMessage: failure.message,
        ),
      );
    }
  }

  void _onCancelled(
    CreateNewProjectCancelled event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(state.copyWith(viewStatus: CreateProjectViewStatus.cancelled));
  }
}

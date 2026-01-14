import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/projects/domain/usecase/create_project_use_case.dart';
import 'package:contrack/src/features/projects/domain/usecase/generate_project_code_use_case.dart';
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

  CreateNewProjectBloc(
    this._generateProjectCodeUseCase,
    this._createProjectUseCase,
  ) : super(const CreateNewProjectState()) {
    on<CreateNewProjectStartedEvent>(_onStarted);
    on<CreateNewProjectStatusChangedEvent>(_onStatusChanged);
    on<CreateNewProjectImplementingAgencyChangedEvent>(_onAgencyChanged);
    on<CreateNewProjectSupervisingMinistryChangedEvent>(_onMinistryChanged);
    on<CreateNewProjectStateChangedEvent>(_onStateChanged);
    on<CreateNewProjectGeopoliticalZoneChangedEvent>(_onZoneChanged);
    on<CreateNewProjectConstituencyChangedEvent>(_onConstituencyChanged);
    on<CreateNewProjectTitleChangedEvent>(_onTitleChanged);
    on<CreateNewProjectSponsorChangedEvent>(_onSponsorChanged);
    on<CreateNewProjectBugetChangedEvent>(_onBudgetChanged);
    on<CreateNewProjectStartDateChangedEvent>(_onStartDateChanged);
    on<CreateNewProjectEndDateChangedEvent>(_onEndDateChanged);
    on<CreateNewProjectSubmittedEvent>(_onSubmitted);
    on<CreateNewProjectCancelledEvent>(_onCancelled);
  }

  void _onStarted(
    CreateNewProjectStartedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    try {
      final code = _generateProjectCodeUseCase(GenerateProjectCodeParams());
      emit(
        state.copyWith(
          projectCode: code,
          viewStatus: CreateProjectViewStatus.filling,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          viewStatus: CreateProjectViewStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _onStatusChanged(
    CreateNewProjectStatusChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(state.copyWith(status: RequiredProjectStatus.dirty(event.status)));
  }

  void _onAgencyChanged(
    CreateNewProjectImplementingAgencyChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(
      state.copyWith(
        implementingAgencyId: RequiredId.dirty(event.implementingAgencyId),
      ),
    );
  }

  void _onMinistryChanged(
    CreateNewProjectSupervisingMinistryChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(
      state.copyWith(
        supervisingMinistryId: RequiredId.dirty(event.supervisingMinistryId),
      ),
    );
  }

  void _onStateChanged(
    CreateNewProjectStateChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(state.copyWith(stateId: RequiredId.dirty(event.stateId)));
  }

  void _onZoneChanged(
    CreateNewProjectGeopoliticalZoneChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(
      state.copyWith(
        geopoliticalZoneId: RequiredId.dirty(event.geopoliticalZoneId),
      ),
    );
  }

  void _onConstituencyChanged(
    CreateNewProjectConstituencyChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(state.copyWith(constituency: RequiredText.dirty(event.constituency)));
  }

  void _onTitleChanged(
    CreateNewProjectTitleChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(state.copyWith(title: RequiredText.dirty(event.title)));
  }

  void _onSponsorChanged(
    CreateNewProjectSponsorChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(state.copyWith(sponsor: event.sponsor));
  }

  void _onBudgetChanged(
    CreateNewProjectBugetChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(state.copyWith(budget: RequiredDouble.dirty(event.budget)));
  }

  void _onStartDateChanged(
    CreateNewProjectStartDateChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(state.copyWith(startDate: RequiredDate.dirty(event.startDate)));
  }

  void _onEndDateChanged(
    CreateNewProjectEndDateChangedEvent event,
    Emitter<CreateNewProjectState> emit,
  ) {
    emit(state.copyWith(endDate: RequiredDate.dirty(event.endDate)));
  }

  Future<void> _onSubmitted(
    CreateNewProjectSubmittedEvent event,
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
      await _createProjectUseCase(
        CreateProjectParams(
          code: state.projectCode,
          status: state.status.value!,
          agencyId: state.implementingAgencyId.value,
          ministryId: state.supervisingMinistryId.value,
          stateId: state.stateId.value,
          zoneId: state.geopoliticalZoneId.value,
          constituency: state.constituency.value,
          amount: state.budget.value,
          sponsor: state.sponsor.isEmpty ? null : state.sponsor,
          title: state.title.value,
          startDate: state.startDate.value!,
          endDate: state.endDate.value!,
        ),
      );
      emit(state.copyWith(viewStatus: CreateProjectViewStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          viewStatus: CreateProjectViewStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _onCancelled(
    CreateNewProjectCancelledEvent event,
    Emitter<CreateNewProjectState> emit,
  ) => emit(state.copyWith(viewStatus: CreateProjectViewStatus.cancelled));
}

import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/domain/usecase/get_project_by_code_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'project_event.dart';
part 'project_state.dart';
part 'project_bloc.freezed.dart';

@injectable
class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final GetProjectByCodeUseCase _getProjectByCodeUseCase;

  ProjectBloc(this._getProjectByCodeUseCase) : super(const ProjectState()) {
    on<ProjectFetchByCodeEvent>(_onFetchByCode);
  }

  Future<void> _onFetchByCode(
    ProjectFetchByCodeEvent event,
    Emitter<ProjectState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        projectCode: event.code,
      ),
    );

    try {
      final project = await _getProjectByCodeUseCase(
        GetProjectByCodeParams(code: event.code),
      );

      if (project == null) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Project not found with code: ${event.code}',
            projectCode: event.code,
          ),
        );
      } else {
        emit(
          state.copyWith(
            project: project,
            projectCode: event.code,
            isLoading: false,
            errorMessage: null,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: e.toString(),
          projectCode: event.code,
        ),
      );
    }
  }
}

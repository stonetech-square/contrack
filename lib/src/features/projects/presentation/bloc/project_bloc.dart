import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/projects/domain/usecase/export_project_use_case.dart';
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
  final ExportProjectUseCase _exportProjectUseCase;

  ProjectBloc(this._getProjectByCodeUseCase, this._exportProjectUseCase)
    : super(const ProjectState()) {
    on<ProjectFetchByCodeEvent>(_onFetchByCode);
    on<ProjectExportRequestedEvent>(_onExportRequested);
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
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
          projectCode: event.code,
        ),
      );
    }
  }

  Future<void> _onExportRequested(
    ProjectExportRequestedEvent event,
    Emitter<ProjectState> emit,
  ) async {
    if (state.project == null) {
      emit(
        state.copyWith(
          isExporting: false,
          exportError: 'No project data to export',
          exportFilePath: null,
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        isExporting: true,
        exportError: null,
        exportFilePath: null,
      ),
    );

    try {
      final filePath = await _exportProjectUseCase(
        ExportProjectParams(project: state.project!, format: event.format),
      );

      emit(
        state.copyWith(
          isExporting: false,
          exportFilePath: filePath,
          exportError: null,
        ),
      );
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(
        state.copyWith(
          isExporting: false,
          exportError: failure.message,
          exportFilePath: null,
        ),
      );
    }
  }
}

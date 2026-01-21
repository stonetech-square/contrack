import 'dart:async';
import 'dart:io';

import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/usecase/usecase.dart';

import 'package:contrack/src/core/database/tables/export_history.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:contrack/src/features/dashboard/domain/usecase/import_projects_use_case.dart';
import 'package:contrack/src/features/dashboard/domain/usecase/pick_project_file_use_case.dart';
import 'package:contrack/src/features/projects/domain/entities/export_type.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:contrack/src/features/projects/domain/usecase/delete_project_use_case.dart';
import 'package:contrack/src/features/projects/domain/usecase/export_all_projects_use_case.dart';
import 'package:contrack/src/features/projects/domain/usecase/watch_projects_for_user_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'all_projects_event.dart';
part 'all_projects_state.dart';
part 'all_projects_bloc.freezed.dart';

@injectable
class AllProjectsBloc extends Bloc<AllProjectsEvent, AllProjectsState> {
  final WatchProjectsForUserUseCase _watchProjectsForUserUseCase;
  final ExportAllProjectsUseCase _exportAllProjectsUseCase;
  final DeleteProjectUseCase _deleteProjectUseCase;
  final ImportProjectsUseCase _importProjectsUseCase;
  final PickProjectFileUseCase _pickProjectFileUseCase;

  AllProjectsBloc(
    this._watchProjectsForUserUseCase,
    this._exportAllProjectsUseCase,
    this._deleteProjectUseCase,
    this._importProjectsUseCase,
    this._pickProjectFileUseCase,
  ) : super(const AllProjectsState()) {
    on<AllProjectsWatchStarted>(_onWatchStarted);
    on<AllProjectsExportRequested>(_onExportRequested);
    on<AllProjectsPageChanged>(_onPageChanged);
    on<AllProjectsProjectDeleted>(_onProjectDeleted);
    on<AllProjectsImportRequested>(_onImportRequested);
  }

  Future<void> _onProjectDeleted(
    AllProjectsProjectDeleted event,
    Emitter<AllProjectsState> emit,
  ) async {
    try {
      await _deleteProjectUseCase(DeleteProjectParams(code: event.code));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(state.copyWith(errorMessage: failure.message));
    }
  }

  Future<void> _onWatchStarted(
    AllProjectsWatchStarted event,
    Emitter<AllProjectsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, page: 1));

    try {
      await emit.forEach<List<ProjectWithDetails>>(
        _watchProjectsForUserUseCase(
          WatchProjectsForUserParams(query: event.query, filter: event.filter),
        ),
        onData: (projects) => state.copyWith(
          projects: projects,
          isLoading: false,
          errorMessage: null,
        ),
        onError: (error, stackTrace) =>
            state.copyWith(isLoading: false, errorMessage: error.toString()),
      );
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(state.copyWith(isLoading: false, errorMessage: failure.message));
    }
  }

  void _onPageChanged(
    AllProjectsPageChanged event,
    Emitter<AllProjectsState> emit,
  ) {
    emit(state.copyWith(page: event.page));
  }

  Future<void> _onExportRequested(
    AllProjectsExportRequested event,
    Emitter<AllProjectsState> emit,
  ) async {
    if (state.projects.isEmpty) {
      emit(state.copyWith(exportError: 'No projects to export'));
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
      final filePath = await _exportAllProjectsUseCase(
        ExportAllProjectsParams(format: event.format, type: event.type),
      );
      emit(state.copyWith(isExporting: false, exportFilePath: filePath));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(state.copyWith(isExporting: false, exportError: failure.message));
    }
  }

  Future<void> _onImportRequested(
    AllProjectsImportRequested event,
    Emitter<AllProjectsState> emit,
  ) async {
    try {
      final path = await _pickProjectFileUseCase(NoParams());
      if (path == null) return;

      final file = File(path);
      final projects = await _importProjectsUseCase(file);
      emit(state.copyWith(importedProjects: projects));
      emit(state.copyWith(importedProjects: null));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(state.copyWith(errorMessage: failure.message));
    }
  }
}

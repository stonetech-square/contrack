import 'dart:async';
import 'dart:io';

import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/features/dashboard/domain/usecase/pick_project_file_use_case.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/usecase/import_projects_use_case.dart';
import 'package:contrack/src/features/dashboard/domain/usecase/watch_dashboard_stats_use_case.dart';
import 'package:contrack/src/features/dashboard/domain/usecase/watch_recent_projects_use_case.dart';
import 'package:contrack/src/features/dashboard/domain/entities/dashboard_stats.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project_with_details.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_state.dart';
part 'dashboard_event.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final WatchDashboardStatsUseCase _watchDashboardStatsUseCase;
  final WatchRecentProjectsWithDetailsUseCase
  _watchRecentProjectsWithDetailsUseCase;
  final ImportProjectsUseCase _importProjectsUseCase;
  final PickProjectFileUseCase _pickProjectFileUseCase;

  DashboardBloc(
    this._watchDashboardStatsUseCase,
    this._watchRecentProjectsWithDetailsUseCase,
    this._importProjectsUseCase,
    this._pickProjectFileUseCase,
  ) : super(DashboardState.empty()) {
    on<DashboardStarted>(_onStarted);
    on<DashboardImportRequested>(_onImportRequested);
  }

  Future<void> _onStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    final combinedStream = Rx.combineLatest2(
      _watchDashboardStatsUseCase(NoParams()),
      _watchRecentProjectsWithDetailsUseCase(NoParams()),
      (stats, recentProjects) => (stats: stats, recentProjects: recentProjects),
    );

    await emit.forEach(
      combinedStream,
      onData: (data) {
        return state.copyWith(
          isLoading: false,
          stats: data.stats,
          recentProjects: data.recentProjects,
          error: null,
        );
      },
      onError: (error, stackTrace) {
        final failure = error is Failure
            ? error
            : AppFailure.fromException(error, stackTrace);
        return state.copyWith(error: failure.message, isLoading: false);
      },
    );
  }

  Future<void> _onImportRequested(
    DashboardImportRequested event,
    Emitter<DashboardState> emit,
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
      emit(state.copyWith(error: failure.message));
    }
  }
}

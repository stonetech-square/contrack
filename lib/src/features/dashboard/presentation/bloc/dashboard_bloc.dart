import 'dart:async';

import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/usecase/watch_dashboard_stats_use_case.dart';
import 'package:contrack/src/features/dashboard/domain/usecase/watch_recent_projects_use_case.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@injectable
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final WatchDashboardStatsUseCase _watchDashboardStatsUseCase;
  final WatchRecentProjectsWithDetailsUseCase _watchRecentProjectsWithDetailsUseCase;

  DashboardBloc(
    this._watchDashboardStatsUseCase,
    this._watchRecentProjectsWithDetailsUseCase,
  ) : super(DashboardState.empty()) {
    on<DashboardStarted>(_onStarted);
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
}

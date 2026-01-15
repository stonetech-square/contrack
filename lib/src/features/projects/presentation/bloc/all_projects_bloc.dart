import 'dart:async';

import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
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

  AllProjectsBloc(this._watchProjectsForUserUseCase)
    : super(const AllProjectsState()) {
    on<AllProjectsWatchStarted>(_onWatchStarted);
  }

  Future<void> _onWatchStarted(
    AllProjectsWatchStarted event,
    Emitter<AllProjectsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      await emit.forEach<List<Project>>(
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
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}

import 'dart:async';

import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/seeding/domain/usecase/get_remote_agencies_count_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/get_remote_ministries_count_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/get_remote_projects_count_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/get_remote_users_count_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/seed_agencies_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/seed_ministries_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/seed_projects_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/seed_users_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/watch_agencies_count_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/watch_ministries_count_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/watch_projects_count_use_case.dart';
import 'package:contrack/src/features/seeding/domain/usecase/watch_users_count_use_case.dart';
import 'package:contrack/src/features/seeding/presentation/bloc/seeding_event.dart';
import 'package:contrack/src/features/seeding/presentation/bloc/seeding_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SeedingBloc extends Bloc<SeedingEvent, SeedingState> {
  final SeedUsersUseCase _seedUsersUseCase;
  final SeedMinistriesUseCase _seedMinistriesUseCase;
  final SeedAgenciesUseCase _seedAgenciesUseCase;
  final SeedProjectsUseCase _seedProjectsUseCase;
  final WatchUsersCountUseCase _watchUsersCountUseCase;
  final WatchMinistriesCountUseCase _watchMinistriesCountUseCase;
  final WatchAgenciesCountUseCase _watchAgenciesCountUseCase;
  final WatchProjectsCountUseCase _watchProjectsCountUseCase;
  final GetRemoteUsersCountUseCase _getRemoteUsersCountUseCase;
  final GetRemoteMinistriesCountUseCase _getRemoteMinistriesCountUseCase;
  final GetRemoteAgenciesCountUseCase _getRemoteAgenciesCountUseCase;
  final GetRemoteProjectsCountUseCase _getRemoteProjectsCountUseCase;

  SeedingBloc(
    this._seedUsersUseCase,
    this._seedMinistriesUseCase,
    this._seedAgenciesUseCase,
    this._seedProjectsUseCase,
    this._watchUsersCountUseCase,
    this._watchMinistriesCountUseCase,
    this._watchAgenciesCountUseCase,
    this._watchProjectsCountUseCase,
    this._getRemoteUsersCountUseCase,
    this._getRemoteMinistriesCountUseCase,
    this._getRemoteAgenciesCountUseCase,
    this._getRemoteProjectsCountUseCase,
  ) : super(const SeedingState.initial()) {
    on<SeedingEvent>((event, emit) async {
      await event.map(startSeeding: (e) => _onStartSeeding(e, emit));
    });
  }

  Future<void> _onStartSeeding(
    dynamic event,
    Emitter<SeedingState> emit,
  ) async {
    emit(const SeedingState.inProgress(currentStep: 'Checking data sync...'));

    try {
      final remoteUsersCount = await _getRemoteUsersCountUseCase(NoParams());
      final localUsersCount = await _watchUsersCountUseCase(NoParams()).first;

      final remoteMinistriesCount = await _getRemoteMinistriesCountUseCase(
        NoParams(),
      );
      final localMinistriesCount = await _watchMinistriesCountUseCase(
        NoParams(),
      ).first;

      final remoteAgenciesCount = await _getRemoteAgenciesCountUseCase(
        NoParams(),
      );
      final localAgenciesCount = await _watchAgenciesCountUseCase(
        NoParams(),
      ).first;

      final remoteProjectsCount = await _getRemoteProjectsCountUseCase(
        NoParams(),
      );
      final localProjectsCount = await _watchProjectsCountUseCase(
        NoParams(),
      ).first;

      if (remoteUsersCount == localUsersCount &&
          remoteMinistriesCount == localMinistriesCount &&
          remoteAgenciesCount == localAgenciesCount &&
          remoteProjectsCount == localProjectsCount) {
        emit(const SeedingState.success());
        return;
      }

      await emit.forEach<double>(
        _seedUsersUseCase(NoParams()),
        onData: (progress) => state.maybeMap(
          inProgress: (s) => s.copyWith(
            usersProgress: progress,
            currentStep: 'Seeding Users...',
          ),
          orElse: () => SeedingState.inProgress(
            usersProgress: progress,
            currentStep: 'Seeding Users...',
          ),
        ),
      );

      await emit.forEach<double>(
        _seedMinistriesUseCase(NoParams()),
        onData: (progress) => state.maybeMap(
          inProgress: (s) => s.copyWith(
            ministriesProgress: progress,
            currentStep: 'Seeding Ministries...',
          ),
          orElse: () => SeedingState.inProgress(
            ministriesProgress: progress,
            currentStep: 'Seeding Ministries...',
          ),
        ),
      );

      await emit.forEach<double>(
        _seedAgenciesUseCase(NoParams()),
        onData: (progress) => state.maybeMap(
          inProgress: (s) => s.copyWith(
            agenciesProgress: progress,
            currentStep: 'Seeding Agencies...',
          ),
          orElse: () => SeedingState.inProgress(
            agenciesProgress: progress,
            currentStep: 'Seeding Agencies...',
          ),
        ),
      );

      await emit.forEach<double>(
        _seedProjectsUseCase(NoParams()),
        onData: (progress) => state.maybeMap(
          inProgress: (s) => s.copyWith(
            projectsProgress: progress,
            currentStep: 'Seeding Projects...',
          ),
          orElse: () => SeedingState.inProgress(
            projectsProgress: progress,
            currentStep: 'Seeding Projects...',
          ),
        ),
      );

      emit(const SeedingState.success());
    } catch (e) {
      emit(SeedingState.failure(e.toString()));
    }
  }
}

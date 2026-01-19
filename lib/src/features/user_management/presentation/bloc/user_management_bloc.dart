import 'dart:async';

import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/features/user_management/domain/usecase/toggle_user_status_use_case.dart';

import 'package:contrack/src/features/user_management/domain/usecase/watch_users_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_management_event.dart';
part 'user_management_state.dart';
part 'user_management_bloc.freezed.dart';

@injectable
class UserManagementBloc
    extends Bloc<UserManagementEvent, UserManagementState> {
  final WatchUsersUseCase _watchUsersUseCase;
  final ToggleUserStatusUseCase _toggleUserStatusUseCase;
  UserManagementBloc(this._watchUsersUseCase, this._toggleUserStatusUseCase)
    : super(const UserManagementState()) {
    on<UserWatchStarted>(_onWatchStarted);
    on<UserStatusToggled>(_onStatusToggled);
  }

  Future<void> _onWatchStarted(
    UserWatchStarted event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(state.copyWith(isLoadingUsers: true, errorMessage: null));

    await emit.forEach<List<db.User>>(
      _watchUsersUseCase(WatchUsersParams(searchQuery: event.searchQuery)),
      onData: (users) => state.copyWith(
        users: users,
        isLoadingUsers: false,
        errorMessage: null,
      ),
      onError: (error, stackTrace) =>
          state.copyWith(isLoadingUsers: false, errorMessage: error.toString()),
    );
  }

  Future<void> _onStatusToggled(
    UserStatusToggled event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(state.copyWith(togglingUserId: event.userId, toggleError: null));
    try {
      await _toggleUserStatusUseCase(ToggleUserStatusParams(event.userId));
      emit(state.copyWith(togglingUserId: null));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(
        state.copyWith(togglingUserId: null, toggleError: failure.message),
      );
    }
  }
}

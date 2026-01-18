import 'dart:async';

import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/features/user_management/domain/usecase/update_user_use_case.dart';
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
  final UpdateUserUseCase _updateUserUseCase;

  UserManagementBloc(this._watchUsersUseCase, this._updateUserUseCase)
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
    emit(state.copyWith(isTogglingStatus: true, toggleError: null));
    try {
      await _updateUserUseCase(
        UpdateUserParams(
          userId: event.user.uid,
          fullName: event.user.fullName,
          email: event.user.email,
          username: event.user.username,
        ),
      );
      emit(state.copyWith(isTogglingStatus: false));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(
        state.copyWith(isTogglingStatus: false, toggleError: failure.message),
      );
    }
  }
}

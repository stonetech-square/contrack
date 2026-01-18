import 'dart:async';

import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/features/user_management/domain/usecase/create_user_use_case.dart';
import 'package:contrack/src/features/user_management/domain/usecase/update_user_use_case.dart';
import 'package:contrack/src/features/user_management/domain/usecase/watch_users_use_case.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/inputs/inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'user_management_event.dart';
part 'user_management_state.dart';
part 'user_management_bloc.freezed.dart';

@injectable
class UserManagementBloc
    extends Bloc<UserManagementEvent, UserManagementState> {
  final WatchUsersUseCase _watchUsersUseCase;
  final CreateUserUseCase _createUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;

  UserManagementBloc(
    this._watchUsersUseCase,
    this._createUserUseCase,
    this._updateUserUseCase,
  ) : super(const UserManagementState()) {
    on<UserWatchStarted>(_onWatchStarted);
    on<UserCreationRequested>(_onCreationRequested);
    on<UserUpdateRequested>(_onUpdateRequested);
    on<UserFullNameChanged>(_onFullNameChanged);
    on<UserEmailChanged>(_onEmailChanged);
    on<UserUsernameChanged>(_onUsernameChanged);
    on<UserUidChanged>(_onUidChanged);
    on<UserRoleChanged>(_onRoleChanged);
    on<UserActiveStatusChanged>(_onActiveStatusChanged);
    on<UserFormSubmitted>(_onFormSubmitted);
    on<UserFormReset>(_onFormReset);
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

  void _onCreationRequested(
    UserCreationRequested event,
    Emitter<UserManagementState> emit,
  ) {
    emit(
      state.copyWith(
        formStatus: UserFormStatus.filling,
        isEditing: false,
        formErrorMessage: null,
        fullName: const RequiredField.pure(),
        email: const RequiredEmail.pure(),
        username: const RequiredField.pure(),
        uid: const RequiredField.pure(),
        role: const RequiredUserRole.pure(),
        isActive: true,
      ),
    );
  }

  void _onUpdateRequested(
    UserUpdateRequested event,
    Emitter<UserManagementState> emit,
  ) {
    emit(
      state.copyWith(
        formStatus: UserFormStatus.filling,
        isEditing: true,
        formErrorMessage: null,
        fullName: RequiredField.dirty(
          event.user.fullName ?? event.user.username,
        ),
        email: RequiredEmail.dirty(event.user.email),
        username: RequiredField.dirty(event.user.username),
        uid: RequiredField.dirty(event.user.uid),
        role: RequiredUserRole.dirty(event.user.role),
        isActive: event.user.isActive,
      ),
    );
  }

  void _onFullNameChanged(
    UserFullNameChanged event,
    Emitter<UserManagementState> emit,
  ) {
    final fullName = RequiredField.dirty(event.fullName);
    emit(
      state.copyWith(
        fullName: fullName,
        isValid: Formz.validate([
          fullName,
          state.email,
          state.username,
          state.uid,
          state.role,
        ]),
      ),
    );
  }

  void _onEmailChanged(
    UserEmailChanged event,
    Emitter<UserManagementState> emit,
  ) {
    final email = RequiredEmail.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.fullName,
          email,
          state.username,
          state.uid,
          state.role,
        ]),
      ),
    );
  }

  void _onUsernameChanged(
    UserUsernameChanged event,
    Emitter<UserManagementState> emit,
  ) {
    final username = RequiredField.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([
          state.fullName,
          state.email,
          username,
          state.uid,
          state.role,
        ]),
      ),
    );
  }

  void _onUidChanged(UserUidChanged event, Emitter<UserManagementState> emit) {
    final uid = RequiredField.dirty(event.uid);
    emit(
      state.copyWith(
        uid: uid,
        isValid: Formz.validate([
          state.fullName,
          state.email,
          state.username,
          uid,
          state.role,
        ]),
      ),
    );
  }

  void _onRoleChanged(
    UserRoleChanged event,
    Emitter<UserManagementState> emit,
  ) {
    final role = RequiredUserRole.dirty(event.role);
    emit(
      state.copyWith(
        role: role,
        isValid: Formz.validate([
          state.fullName,
          state.email,
          state.username,
          state.uid,
          role,
        ]),
      ),
    );
  }

  void _onActiveStatusChanged(
    UserActiveStatusChanged event,
    Emitter<UserManagementState> emit,
  ) {
    emit(state.copyWith(isActive: event.isActive));
  }

  Future<void> _onFormSubmitted(
    UserFormSubmitted event,
    Emitter<UserManagementState> emit,
  ) async {
    if (!state.isValid) return;

    emit(
      state.copyWith(
        formStatus: UserFormStatus.submitting,
        formErrorMessage: null,
      ),
    );

    try {
      final user = db.User(
        uid: state.uid.value,
        email: state.email.value,
        fullName: state.fullName.value,
        username: state.username.value,
        role: state.role.value ?? UserRole.regular,
        isActive: state.isActive,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        lastLoginAt: DateTime.now(),
        isSynced: false,
        lastSyncedAt: DateTime.now(),
      );

      if (state.isEditing) {
        await _updateUserUseCase(UpdateUserParams(user: user));
      } else {
        await _createUserUseCase(CreateUserParams(user: user));
      }

      emit(state.copyWith(formStatus: UserFormStatus.success));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(
        state.copyWith(
          formStatus: UserFormStatus.failure,
          formErrorMessage: failure.message,
        ),
      );
    }
  }

  void _onFormReset(UserFormReset event, Emitter<UserManagementState> emit) {
    emit(
      state.copyWith(
        formStatus: UserFormStatus.initial,
        fullName: const RequiredField.pure(),
        email: const RequiredEmail.pure(),
        username: const RequiredField.pure(),
        uid: const RequiredField.pure(),
        role: const RequiredUserRole.pure(),
        isActive: true,
        isEditing: false,
        formErrorMessage: null,
        isValid: false,
      ),
    );
  }

  Future<void> _onStatusToggled(
    UserStatusToggled event,
    Emitter<UserManagementState> emit,
  ) async {
    emit(state.copyWith(isTogglingStatus: true, toggleError: null));
    try {
      final updatedUser = event.user.copyWith(isActive: !event.user.isActive);
      await _updateUserUseCase(UpdateUserParams(user: updatedUser));
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

import 'dart:async';

import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/features/user_management/domain/usecase/create_user_use_case.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/inputs/inputs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';
part 'create_user_bloc.freezed.dart';

@injectable
class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  final CreateUserUseCase _createUserUseCase;

  CreateUserBloc(this._createUserUseCase) : super(const CreateUserState()) {
    on<CreateUserStarted>(_onStarted);
    on<CreateUserFullNameChanged>(_onFullNameChanged);
    on<CreateUserEmailChanged>(_onEmailChanged);
    on<CreateUserUsernameChanged>(_onUsernameChanged);
    on<CreateUserRoleChanged>(_onRoleChanged);
    on<CreateUserSubmitted>(_onSubmitted);
  }

  void _onStarted(CreateUserStarted event, Emitter<CreateUserState> emit) {
    emit(const CreateUserState());
  }

  void _onFullNameChanged(
    CreateUserFullNameChanged event,
    Emitter<CreateUserState> emit,
  ) {
    final fullName = RequiredField.dirty(event.fullName);
    emit(
      state.copyWith(
        fullName: fullName,
        isValid: Formz.validate([
          fullName,
          state.email,
          state.username,
          state.role,
        ]),
      ),
    );
  }

  void _onEmailChanged(
    CreateUserEmailChanged event,
    Emitter<CreateUserState> emit,
  ) {
    final email = RequiredEmail.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([
          state.fullName,
          email,
          state.username,
          state.role,
        ]),
      ),
    );
  }

  void _onUsernameChanged(
    CreateUserUsernameChanged event,
    Emitter<CreateUserState> emit,
  ) {
    final username = RequiredField.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([
          state.fullName,
          state.email,
          username,
          state.role,
        ]),
      ),
    );
  }

  void _onRoleChanged(
    CreateUserRoleChanged event,
    Emitter<CreateUserState> emit,
  ) {
    final role = RequiredUserRole.dirty(event.role);
    emit(
      state.copyWith(
        role: role,
        isValid: Formz.validate([
          state.fullName,
          state.email,
          state.username,
          role,
        ]),
      ),
    );
  }

  Future<void> _onSubmitted(
    CreateUserSubmitted event,
    Emitter<CreateUserState> emit,
  ) async {
    final isValid = Formz.validate([
      state.fullName,
      state.email,
      state.username,
      state.role,
    ]);

    if (!isValid) {
      emit(state.copyWith(isValid: false));
      return;
    }

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        errorMessage: null,
      ),
    );

    try {
      await _createUserUseCase(
        CreateUserParams(
          fullName: state.fullName.value,
          email: state.email.value,
          username: state.username.value,
          role: state.role.value ?? UserRole.regular,
        ),
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e, stackTrace) {
      final failure = e is Failure
          ? e
          : AppFailure.fromException(e, stackTrace);
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: failure.message,
        ),
      );
    }
  }
}

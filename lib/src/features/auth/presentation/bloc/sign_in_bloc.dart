import 'package:contrack/src/core/errors/failures.dart';
import 'package:contrack/src/features/auth/domain/usecase/sign_in_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase _signInUseCase;

  SignInBloc(this._signInUseCase) : super(SignInState.initial()) {
    on<SignInSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        errorMessage: null,
      ),
    );

    try {
      await _signInUseCase(
        SignInParams(email: event.email, password: event.password),
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on AppFailure catch (e) {
      final message = e.message;
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: message,
        ),
      );
    }
  }
}

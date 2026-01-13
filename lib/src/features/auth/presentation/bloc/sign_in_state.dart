part of 'sign_in_bloc.dart';

@freezed
sealed class SignInState with _$SignInState {
  const factory SignInState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    String? errorMessage,
  }) = _SignInState;

  factory SignInState.initial() => const SignInState();
}

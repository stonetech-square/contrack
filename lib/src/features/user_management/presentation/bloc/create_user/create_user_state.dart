part of 'create_user_bloc.dart';

@freezed
sealed class CreateUserState with _$CreateUserState {
  const factory CreateUserState({
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus status,
    @Default(RequiredField.pure()) RequiredField fullName,
    @Default(RequiredEmail.pure()) RequiredEmail email,
    @Default(RequiredField.pure()) RequiredField username,
    @Default(RequiredUserRole.pure()) RequiredUserRole role,
    @Default(null) String? errorMessage,
    @Default(false) bool isValid,
  }) = _CreateUserState;

  const CreateUserState._();
}

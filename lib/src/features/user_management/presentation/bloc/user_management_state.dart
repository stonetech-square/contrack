part of 'user_management_bloc.dart';

enum UserFormStatus { initial, filling, submitting, success, failure }

@freezed
sealed class UserManagementState with _$UserManagementState {
  const factory UserManagementState({
    @Default([]) List<db.User> users,
    @Default(false) bool isLoadingUsers,
    @Default(null) String? errorMessage,
    @Default(UserFormStatus.initial) UserFormStatus formStatus,
    @Default(RequiredField.pure()) RequiredField fullName,
    @Default(RequiredEmail.pure()) RequiredEmail email,
    @Default(RequiredField.pure()) RequiredField username,
    @Default(RequiredField.pure()) RequiredField uid,
    @Default(RequiredUserRole.pure()) RequiredUserRole role,
    @Default(true) bool isActive,
    @Default(false) bool isEditing,
    @Default(null) String? formErrorMessage,
    @Default(false) bool isValid,
    @Default(false) bool isTogglingStatus,
    @Default(null) String? toggleError,
  }) = _UserManagementState;

  const UserManagementState._();

  bool get isFormValid =>
      Formz.validate([fullName, email, username, uid, role]);
}

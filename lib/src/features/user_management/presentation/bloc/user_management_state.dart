part of 'user_management_bloc.dart';

@freezed
sealed class UserManagementState with _$UserManagementState {
  const factory UserManagementState({
    @Default([]) List<db.User> users,
    @Default(false) bool isLoadingUsers,
    @Default(null) String? errorMessage,
    @Default(false) bool isTogglingStatus,
    @Default(null) String? toggleError,
  }) = _UserManagementState;

  const UserManagementState._();
}

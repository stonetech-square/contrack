part of 'user_management_bloc.dart';

@freezed
sealed class UserManagementState with _$UserManagementState {
  const factory UserManagementState({
    @Default([]) List<db.User> users,
    @Default(false) bool isLoadingUsers,
    @Default(null) String? errorMessage,
    @Default(null) String? togglingUserId,
    @Default(null) String? toggleError,
    @Default(null) String? changingRoleUserId,
    @Default(null) String? changeRoleError,
  }) = _UserManagementState;

  const UserManagementState._();
}

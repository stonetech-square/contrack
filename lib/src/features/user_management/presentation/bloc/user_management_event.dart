part of 'user_management_bloc.dart';

abstract class UserManagementEvent extends Equatable {
  const UserManagementEvent();

  @override
  List<Object?> get props => [];
}

class UserWatchStarted extends UserManagementEvent {
  final String? searchQuery;

  const UserWatchStarted({this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}

class UserStatusToggled extends UserManagementEvent {
  final String userId;

  const UserStatusToggled(this.userId);

  @override
  List<Object?> get props => [userId];
}

class UserRoleChanged extends UserManagementEvent {
  final String userId;
  final UserRole role;

  const UserRoleChanged(this.userId, this.role);

  @override
  List<Object?> get props => [userId, role];
}

class InvitationResent extends UserManagementEvent {
  final String userId;

  const InvitationResent(this.userId);

  @override
  List<Object?> get props => [userId];
}

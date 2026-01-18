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

class UserCreationRequested extends UserManagementEvent {
  const UserCreationRequested();
}

class UserUpdateRequested extends UserManagementEvent {
  final db.User user;

  const UserUpdateRequested(this.user);

  @override
  List<Object?> get props => [user];
}

class UserFullNameChanged extends UserManagementEvent {
  final String fullName;

  const UserFullNameChanged(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

class UserEmailChanged extends UserManagementEvent {
  final String email;

  const UserEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class UserUsernameChanged extends UserManagementEvent {
  final String username;

  const UserUsernameChanged(this.username);

  @override
  List<Object?> get props => [username];
}

class UserUidChanged extends UserManagementEvent {
  final String uid;

  const UserUidChanged(this.uid);

  @override
  List<Object?> get props => [uid];
}

class UserRoleChanged extends UserManagementEvent {
  final UserRole role;

  const UserRoleChanged(this.role);

  @override
  List<Object?> get props => [role];
}

class UserActiveStatusChanged extends UserManagementEvent {
  final bool isActive;

  const UserActiveStatusChanged(this.isActive);

  @override
  List<Object?> get props => [isActive];
}

class UserFormSubmitted extends UserManagementEvent {
  const UserFormSubmitted();
}

class UserFormReset extends UserManagementEvent {
  const UserFormReset();
}

class UserStatusToggled extends UserManagementEvent {
  final db.User user;

  const UserStatusToggled(this.user);

  @override
  List<Object?> get props => [user];
}

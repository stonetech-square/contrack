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
  final db.User user;

  const UserStatusToggled(this.user);

  @override
  List<Object?> get props => [user];
}

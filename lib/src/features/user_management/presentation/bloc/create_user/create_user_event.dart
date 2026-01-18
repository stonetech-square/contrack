part of 'create_user_bloc.dart';

abstract class CreateUserEvent extends Equatable {
  const CreateUserEvent();

  @override
  List<Object?> get props => [];
}

class CreateUserStarted extends CreateUserEvent {
  const CreateUserStarted();
}

class CreateUserFullNameChanged extends CreateUserEvent {
  final String fullName;
  const CreateUserFullNameChanged(this.fullName);
  @override
  List<Object?> get props => [fullName];
}

class CreateUserEmailChanged extends CreateUserEvent {
  final String email;
  const CreateUserEmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class CreateUserUsernameChanged extends CreateUserEvent {
  final String username;
  const CreateUserUsernameChanged(this.username);
  @override
  List<Object?> get props => [username];
}

class CreateUserUidChanged extends CreateUserEvent {
  final String uid;
  const CreateUserUidChanged(this.uid);
  @override
  List<Object?> get props => [uid];
}

class CreateUserRoleChanged extends CreateUserEvent {
  final UserRole role;
  const CreateUserRoleChanged(this.role);
  @override
  List<Object?> get props => [role];
}

class CreateUserSubmitted extends CreateUserEvent {
  const CreateUserSubmitted();
}

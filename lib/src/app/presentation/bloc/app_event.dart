part of 'app_bloc.dart';

@immutable
sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AppEvent {
  const AppStarted();
}

class AppUserChanged extends AppEvent {
  final AppUser? user;
  const AppUserChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class AppThemeModeToggled extends AppEvent {
  const AppThemeModeToggled();

  @override
  List<Object?> get props => [];
}

class AppLogedOut extends AppEvent {
  const AppLogedOut();

  @override
  List<Object?> get props => [];
}

class AppSyncRequested extends AppEvent {
  const AppSyncRequested();

  @override
  List<Object?> get props => [];
}

import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AppRootScreen extends StatelessWidget {
  const AppRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return AutoRouter.declarative(
          routes: (_) => [
            if (state.user == null) const UnAuthenticatedShellRoute(),
            if (state.user != null) const AuthenticatedShellRoute(),
          ],
        );
      },
    );
  }
}

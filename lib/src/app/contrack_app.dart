import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:toastification/toastification.dart';

class ContrackApp extends StatelessWidget {
  ContrackApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I.get<AppBloc>()..add(const AppStarted()),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return ToastificationWrapper(
            child: MaterialApp.router(
              title: 'Contrack',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.values[state.themeMode],
              routerConfig: _appRouter.config(),
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}

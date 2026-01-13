import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          previous.themeMode != current.themeMode,
      builder: (context, state) {
        return TextButton.icon(
          onPressed: () => BlocProvider.of<AppBloc>(
            context,
          ).add(AppThemeModeToggled()),
          label: Text(
            'Theme (${ThemeMode.values[state.themeMode].name})',
          ),
          icon: Icon(
            state.themeMode == 0
                ? Icons.hdr_auto
                : state.themeMode == 1
                ? Icons.dark_mode
                : Icons.light_mode,
          ),
        );
      },
    );
  }
}

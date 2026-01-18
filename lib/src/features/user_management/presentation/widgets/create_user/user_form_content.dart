import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/create_user/create_user_bloc.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/create_user/sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFormContent extends StatelessWidget {
  const UserFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserBloc, CreateUserState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 32),
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, appState) {
                return AbsorbPointer(
                  absorbing: appState.syncStatus.isOffline,
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: const [IdentityCard(), AccessControlCard()],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

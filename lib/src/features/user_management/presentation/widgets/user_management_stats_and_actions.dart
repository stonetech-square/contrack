import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/user_management_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserManagementStatsAndActions extends StatelessWidget {
  const UserManagementStatsAndActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<UserManagementBloc, UserManagementState>(
          builder: (context, state) {
            final total = state.users.length;
            final active = state.users.where((u) => u.isActive).length;
            return Text(
              '$total total users • $active active',
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textSubtle,
              ),
            );
          },
        ),
        const Spacer(),
        BlocBuilder<AppBloc, AppState>(
          buildWhen: (previous, current) =>
              previous.syncStatus != current.syncStatus,
          builder: (context, state) {
            final isOffline = state.syncStatus.isOffline;
            return FilledButton.icon(
              onPressed: isOffline
                  ? null
                  : () => context.router.push(const CreateUserRoute()),
              style: FilledButton.styleFrom(
                maximumSize: const Size(150, 45),
                minimumSize: const Size(150, 45),
              ),
              label: const Text('Create User'),
              icon: const Icon(Icons.person_add_outlined),
            );
          },
        ),
      ],
    );
  }
}

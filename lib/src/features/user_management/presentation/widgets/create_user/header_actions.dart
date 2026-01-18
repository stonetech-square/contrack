import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/user_management/presentation/bloc/create_user/create_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HeaderActions extends StatelessWidget {
  const HeaderActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserBloc, CreateUserState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, userState) {
        final isSubmitting =
            userState.status == FormzSubmissionStatus.inProgress;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'New User Entry',
                  style: context.textStyles.titleLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Fill in the details to create a new user account.',
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textSubtle,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(110, 44.28),
                    maximumSize: const Size(120, 44.28),
                    backgroundColor: context.colors.neutralInverted,
                    foregroundColor: context.colors.textHeading,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: context.colors.border, width: 1),
                    ),
                  ),
                  label: const Text('Cancel'),
                  icon: const Icon(Icons.close),
                  onPressed: () => context.router.back(),
                ),
                const SizedBox(width: 12),
                BlocBuilder<AppBloc, AppState>(
                  buildWhen: (p, c) => p.syncStatus != c.syncStatus,
                  builder: (context, appState) {
                    final isOffline = appState.syncStatus.isOffline;
                    return FilledButton.icon(
                      style: FilledButton.styleFrom(
                        minimumSize: const Size(130, 44.28),
                        maximumSize: const Size(140, 44.28),
                        backgroundColor: context.colors.primary,
                        foregroundColor: context.colors.neutralInverted,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: context.colors.border,
                            width: 1,
                          ),
                        ),
                      ),
                      label: isSubmitting
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: context.colors.neutralInverted,
                              ),
                            )
                          : const Text('Create'),
                      icon: isSubmitting
                          ? const SizedBox.shrink()
                          : const Icon(Icons.save),
                      onPressed: isSubmitting || isOffline
                          ? null
                          : () => context.read<CreateUserBloc>().add(
                              const CreateUserSubmitted(),
                            ),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

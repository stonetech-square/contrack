import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/di/injection.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/utils/toast_extension.dart';
import 'package:contrack/src/features/seeding/presentation/bloc/seeding_bloc.dart';
import 'package:contrack/src/features/seeding/presentation/bloc/seeding_event.dart';
import 'package:contrack/src/features/seeding/presentation/bloc/seeding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SeedingScreen extends StatelessWidget {
  const SeedingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SeedingBloc>()..add(const SeedingEvent.startSeeding()),
      child: BlocConsumer<SeedingBloc, SeedingState>(
        listener: (context, state) {
          state.mapOrNull(
            success: (_) {
              context.router.replace(const AuhtenticatedMainRoute());
            },
            failure: (f) {
              context.toast.error(f.message, title: 'Seeding Failed');
            },
          );
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Setting up your workspace...',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const Gap(32),
                    state.maybeMap(
                      inProgress: (progress) {
                        final totalProgress =
                            (progress.usersProgress +
                                progress.ministriesProgress +
                                progress.agenciesProgress +
                                progress.projectsProgress) /
                            4;
                        return Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 200,
                                  width: 200,
                                  child: CircularProgressIndicator(
                                    value: totalProgress,
                                    strokeWidth: 12,
                                    backgroundColor:
                                        context.colors.surfaceVariant,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      context.colors.primary,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${(totalProgress * 100).toInt()}%',
                                      style: context.textStyles.displayMedium
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: context.colors.primary,
                                          ),
                                    ),
                                    const Gap(8),
                                    Text(
                                      'Completed',
                                      style: context.textStyles.bodyMedium
                                          .copyWith(
                                            color: context.colors.textSubtle,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Gap(48),
                            Text(
                              progress.currentStep,
                              style: context.textStyles.titleMedium.copyWith(
                                color: context.colors.textBody,
                              ),
                            ),
                            const Gap(8),
                            SizedBox(
                              width: 200,
                              child: LinearProgressIndicator(
                                value: null,
                                minHeight: 4,
                                backgroundColor: Colors.transparent,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  context.colors.primary.withValues(alpha: 0.2),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      orElse: () => const CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

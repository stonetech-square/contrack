import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/di/injection.dart';
import 'package:contrack/src/app/router/app_router.dart';
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
                      inProgress: (progress) => Column(
                        children: [
                          _ProgressItem(
                            label: 'Users',
                            value: progress.usersProgress,
                          ),
                          const Gap(16),
                          _ProgressItem(
                            label: 'Ministries',
                            value: progress.ministriesProgress,
                          ),
                          const Gap(16),
                          _ProgressItem(
                            label: 'Agencies',
                            value: progress.agenciesProgress,
                          ),
                          const Gap(16),
                          _ProgressItem(
                            label: 'Projects',
                            value: progress.projectsProgress,
                          ),
                          const Gap(32),
                          Text(progress.currentStep),
                        ],
                      ),
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

class _ProgressItem extends StatelessWidget {
  final String label;
  final double value;

  const _ProgressItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(label), Text('${(value * 100).toInt()}%')],
        ),
        const Gap(8),
        LinearProgressIndicator(value: value),
      ],
    );
  }
}

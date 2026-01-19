import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfflineWarning extends StatelessWidget {
  const OfflineWarning({
    super.key,
    this.title = 'You are offline',
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          previous.syncStatus != current.syncStatus,
      builder: (context, state) {
        final isOffline = state.syncStatus.isOffline;

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1,
                child: child,
              ),
            );
          },
          child: isOffline
              ? Container(
                  key: const ValueKey('offline_warning'),
                  margin: const EdgeInsets.only(bottom: 24),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: context.colors.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: context.colors.error.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.wifi_off_rounded,
                        color: context.colors.error,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: context.textStyles.titleSmall.copyWith(
                                fontWeight: FontWeight.bold,
                                color: context.colors.error,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              message,
                              style: context.textStyles.bodySmall.copyWith(
                                color: context.colors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(key: ValueKey('empty')),
        );
      },
    );
  }
}

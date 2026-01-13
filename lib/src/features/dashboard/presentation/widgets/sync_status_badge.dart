import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class SyncStatusBadge extends StatelessWidget {
  const SyncStatusBadge({super.key, required this.isSynced});

  final bool isSynced;

  @override
  Widget build(BuildContext context) {
    if (isSynced) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'synced',
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.success,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.sync_problem_outlined,
          size: 14,
          color: context.colors.warning,
        ),
        SizedBox(width: 4),
        Text(
          'pending',
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.warning,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

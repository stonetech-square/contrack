import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

enum SyncStatus { synced, pending, conflict }

class SyncStatusBadge extends StatelessWidget {
  const SyncStatusBadge({
    super.key,
    required this.isSynced,
    this.hasConflict = false,
  });

  final bool isSynced;
  final bool hasConflict;

  @override
  Widget build(BuildContext context) {
    SyncStatus status;
    if (hasConflict) {
      status = SyncStatus.conflict;
    } else if (isSynced) {
      status = SyncStatus.synced;
    } else {
      status = SyncStatus.pending;
    }

    Color backgroundColor;
    Color textColor;
    String label;

    switch (status) {
      case SyncStatus.synced:
        backgroundColor = context.colors.bgGreen;
        textColor = context.colors.statusCompleted;
        label = 'synced';
        break;
      case SyncStatus.pending:
        backgroundColor = context.colors.bgOrange;
        textColor = context.colors.statusPlanned;
        label = 'pending';
        break;
      case SyncStatus.conflict:
        backgroundColor = context.colors.bgRed;
        textColor = context.colors.error;
        label = 'conflict';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: context.textStyles.labelSmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

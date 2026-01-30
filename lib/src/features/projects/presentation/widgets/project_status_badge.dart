import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:flutter/material.dart';

class ProjectStatusBadge extends StatelessWidget {
  const ProjectStatusBadge({super.key, required this.status});

  final InHouseStatus status;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (status) {
      case InHouseStatus.ongoing:
        backgroundColor = context.colors.bgOrange.withValues(alpha: 0.1);
        textColor = context.colors.statusPlanned;
        break;
      case InHouseStatus.notStarted:
        backgroundColor = context.colors.bgGray.withValues(alpha: 0.1);
        textColor = context.colors.textSubtle;
        break;
      case InHouseStatus.completed:
        backgroundColor = context.colors.bgGreen.withValues(alpha: 0.1);
        textColor = context.colors.statusCompleted;
        break;
      case InHouseStatus.suspended:
        backgroundColor = context.colors.bgRed.withValues(alpha: 0.1);
        textColor = context.colors.statusStalled;
        break;
      case InHouseStatus.cancelled:
        backgroundColor = context.colors.bgGray.withValues(alpha: 0.1);
        textColor = context.colors.statusCancelled;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: textColor.withValues(alpha: 0.3)),
      ),
      child: Text(
        status.displayName,
        style: context.textStyles.labelSmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:flutter/material.dart';

class ProjectStatusBadge extends StatelessWidget {
  const ProjectStatusBadge({super.key, required this.status});

  final ProjectStatus status;

  @override
  Widget build(BuildContext context) {
    final config = _getStatusConfig(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(right: 16),
      constraints: BoxConstraints(maxWidth: 79, maxHeight: 50),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status.displayName,
        style: context.textStyles.labelSmall.copyWith(
          color: config.textColor,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  _StatusConfig _getStatusConfig(BuildContext context) {
    switch (status) {
      case ProjectStatus.ongoing:
        return _StatusConfig(
          backgroundColor: context.colors.bgOrange,
          textColor: context.colors.warning,
        );
      case ProjectStatus.notStarted:
        return _StatusConfig(
          backgroundColor: context.colors.bgGray,
          textColor: context.colors.textSubtle,
        );
      case ProjectStatus.completed:
        return _StatusConfig(
          backgroundColor: context.colors.bgGreen,
          textColor: context.colors.success,
        );
      case ProjectStatus.suspended:
        return _StatusConfig(
          backgroundColor: context.colors.bgRed,
          textColor: context.colors.error,
        );
      case ProjectStatus.cancelled:
        return _StatusConfig(
          backgroundColor: context.colors.bgGray,
          textColor: context.colors.textSubtle,
        );
    }
  }
}

class _StatusConfig {
  final Color backgroundColor;
  final Color textColor;

  _StatusConfig({required this.backgroundColor, required this.textColor});
}

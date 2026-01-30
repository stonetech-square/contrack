import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:flutter/material.dart';

class ProjectStatusBadge extends StatelessWidget {
  const ProjectStatusBadge({
    super.key,
    required this.inhouseStatus,
    required this.status,
  });

  final InHouseStatus inhouseStatus;
  final ProjectStatus status;

  @override
  Widget build(BuildContext context) {
    final config = _getStatusConfig(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      margin: const EdgeInsets.only(right: 16),
      constraints: BoxConstraints(maxWidth: 85, maxHeight: 45),
      decoration: BoxDecoration(
        color: config.backgroundColor.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text.rich(
        TextSpan(
          text: status.displayName,
          style: context.textStyles.labelSmall.copyWith(
            color: config.textColor,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: ' (${inhouseStatus.displayName})',
              style: context.textStyles.labelSmall.copyWith(
                color: config.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.start,
      ),
    );
  }

  _StatusConfig _getStatusConfig(BuildContext context) {
    switch (inhouseStatus) {
      case InHouseStatus.ongoing:
        return _StatusConfig(
          backgroundColor: context.colors.bgOrange,
          textColor: context.colors.warning,
        );
      case InHouseStatus.notStarted:
        return _StatusConfig(
          backgroundColor: context.colors.bgGray,
          textColor: context.colors.textSubtle,
        );
      case InHouseStatus.completed:
        return _StatusConfig(
          backgroundColor: context.colors.bgGreen,
          textColor: context.colors.success,
        );
      case InHouseStatus.suspended:
        return _StatusConfig(
          backgroundColor: context.colors.bgRed,
          textColor: context.colors.error,
        );
      case InHouseStatus.cancelled:
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

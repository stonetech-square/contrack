import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class UserStatusBadge extends StatelessWidget {
  const UserStatusBadge({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final bgColor = isActive
        ? context.colors.success.withValues(alpha: 0.1)
        : context.colors.primary.withValues(alpha: 0.1);
    final textColor = isActive
        ? context.colors.success
        : context.colors.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        isActive ? 'Active' : 'Inactive',
        style: context.textStyles.labelSmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

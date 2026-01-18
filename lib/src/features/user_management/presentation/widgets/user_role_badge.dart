import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:flutter/material.dart';

class UserRoleBadge extends StatelessWidget {
  const UserRoleBadge({super.key, required this.role});

  final UserRole role;

  @override
  Widget build(BuildContext context) {
    final isStaff = role == UserRole.regular;
    final bgColor = isStaff
        ? context.colors.primary.withValues(alpha: 0.1)
        : context.colors.info.withValues(alpha: 0.1);
    final textColor = isStaff ? context.colors.primary : context.colors.info;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        role == UserRole.admin ? 'Admin' : 'Staff',
        style: context.textStyles.labelSmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

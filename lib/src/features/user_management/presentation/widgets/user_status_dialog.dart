import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/core/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class UserStatusDialog extends StatelessWidget {
  const UserStatusDialog({super.key, required this.user});

  final db.User user;

  static Future<bool?> show(BuildContext context, db.User user) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => UserStatusDialog(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isActivating = !user.isActive;
    final actionText = isActivating ? 'Activate' : 'Suspend';
    final actionColor = isActivating
        ? context.colors.success
        : context.colors.error;
    final onActionColor = isActivating
        ? context.colors.onSuccess
        : context.colors.onError;

    return Dialog(
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _UserHeader(user: user),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'Are you sure you want to ${actionText.toLowerCase()} this user?',
                    style: context.textStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isActivating
                        ? 'The user will be able to access the system again.'
                        : 'The user will lose access to the system immediately.',
                    style: context.textStyles.bodyMedium.copyWith(
                      color: context.colors.textSubtle,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          style: TextButton.styleFrom(
                            foregroundColor: context.colors.onSurfaceVariant,
                            backgroundColor: context.colors.surfaceVariant,
                            minimumSize: const Size.fromHeight(54),
                          ),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: FilledButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          style: FilledButton.styleFrom(
                            backgroundColor: actionColor,
                            foregroundColor: onActionColor,
                            minimumSize: const Size.fromHeight(54),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(actionText),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserHeader extends StatelessWidget {
  const _UserHeader({required this.user});

  final db.User user;

  @override
  Widget build(BuildContext context) {
    final fullName = user.fullName ?? user.username;
    final email = user.email;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: context.colors.primary.withValues(alpha: 0.1),
            child: Text(
              fullName.initials,
              style: context.textStyles.titleMedium.copyWith(
                color: context.colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  style: context.textStyles.titleMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

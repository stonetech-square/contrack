import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/core/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class UserRoleDialog extends StatefulWidget {
  const UserRoleDialog({super.key, required this.user});

  final db.User user;

  static Future<UserRole?> show(BuildContext context, db.User user) {
    return showDialog<UserRole>(
      context: context,
      barrierDismissible: false,
      builder: (context) => UserRoleDialog(user: user),
    );
  }

  @override
  State<UserRoleDialog> createState() => _UserRoleDialogState();
}

class _UserRoleDialogState extends State<UserRoleDialog> {
  late UserRole _selectedRole;

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.user.role;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 400, minWidth: 200),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _UserHeader(user: widget.user),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Change User Role',

                    style: context.textStyles.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 24),
                  DropdownButtonFormField<UserRole>(
                    initialValue: _selectedRole,
                    decoration: InputDecoration(
                      labelText: 'Role',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    items: UserRole.values.map((role) {
                      return DropdownMenuItem(
                        value: role,
                        child: Text(role.displayName),
                      );
                    }).toList(),
                    onChanged: (role) {
                      if (role != null) {
                        setState(() {
                          _selectedRole = role;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.of(context).pop(),
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
                          onPressed: () =>
                              Navigator.of(context).pop(_selectedRole),
                          style: FilledButton.styleFrom(
                            backgroundColor: context.colors.primary,
                            foregroundColor: context.colors.onPrimary,
                            minimumSize: const Size.fromHeight(54),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Confirm'),
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

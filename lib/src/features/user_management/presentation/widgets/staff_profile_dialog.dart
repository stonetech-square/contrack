import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/core/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class StaffProfileDialog extends StatelessWidget {
  final db.User user;

  const StaffProfileDialog({super.key, required this.user});

  static Future<void> show(BuildContext context, {required db.User user}) {
    return showDialog(
      context: context,
      builder: (context) => StaffProfileDialog(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _StaffProfileHeader(user: user),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _StaffDetailsGrid(user: user),
                    const SizedBox(height: 32),
                    Text(
                      'Account Information',
                      style: context.textStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _StaffAccountInfo(user: user),
                  ],
                ),
              ),
            ),
            const _StaffProfileFooter(),
          ],
        ),
      ),
    );
  }
}

class _StaffProfileHeader extends StatelessWidget {
  const _StaffProfileHeader({required this.user});

  final db.User user;

  @override
  Widget build(BuildContext context) {
    final displayName = user.fullName ?? user.username;
    final role = user.role;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
      decoration: BoxDecoration(
        color: context.colors.black,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: context.colors.surface.withValues(alpha: 0.2),
                child: Text(
                  displayName.initials,
                  style: context.textStyles.headlineSmall.copyWith(
                    color: context.colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: context.textStyles.headlineSmall.copyWith(
                      color: context.colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    role.displayName,
                    style: context.textStyles.bodyMedium.copyWith(
                      color: context.colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: -8,
            right: -8,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.close, color: context.colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _StaffDetailsGrid extends StatelessWidget {
  const _StaffDetailsGrid({required this.user});

  final db.User user;

  String _formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      _DetailItem(
        icon: Icons.email_outlined,
        label: 'Email Address',
        value: user.email,
        isValueLink: true,
      ),
      const _DetailItem(
        icon: Icons.phone_outlined,
        label: 'Phone Number',
        value: '--',
      ),
      const _DetailItem(
        icon: Icons.business_center_outlined,
        label: 'Department',
        value: 'Project Management',
      ),
      const _DetailItem(
        icon: Icons.location_on_outlined,
        label: 'Location',
        value: '--',
      ),
      _DetailItem(
        icon: Icons.person_outline,
        label: 'User ID',
        value: 'USR-${user.uid.substring(0, 8).toUpperCase()}',
      ),
      _DetailItem(
        icon: Icons.calendar_today_outlined,
        label: 'Member Since',
        value: _formatDate(user.createdAt),
      ),
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: items.map((item) => SizedBox(width: 260, child: item)).toList(),
    );
  }
}

class _StaffAccountInfo extends StatelessWidget {
  const _StaffAccountInfo({required this.user});

  final db.User user;

  @override
  Widget build(BuildContext context) {
    final role = user.role;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _StaffInfoRow(
            label: 'Account Status',
            valueWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: user.isActive
                    ? context.colors.success.withValues(alpha: 0.1)
                    : context.colors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                user.isActive ? 'Active' : 'Inactive',
                style: context.textStyles.labelMedium.copyWith(
                  color: user.isActive
                      ? context.colors.success
                      : context.colors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Divider(height: 32, color: context.colors.border),
          _StaffInfoRow(
            label: 'Role',
            valueWidget: Text(
              role.displayName,
              style: context.textStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(height: 32, color: context.colors.border),
          _StaffInfoRow(
            label: 'Username',
            valueWidget: Text(
              user.username,
              style: context.textStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StaffInfoRow extends StatelessWidget {
  const _StaffInfoRow({required this.label, required this.valueWidget});

  final String label;
  final Widget valueWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.onSurfaceVariant,
          ),
        ),
        valueWidget,
      ],
    );
  }
}

class _StaffProfileFooter extends StatelessWidget {
  const _StaffProfileFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: context.colors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                foregroundColor: context.colors.onSurfaceVariant,
                backgroundColor: context.colors.surfaceVariant,
                minimumSize: const Size.fromHeight(54),
              ),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isValueLink;

  const _DetailItem({
    required this.icon,
    required this.label,
    required this.value,
    this.isValueLink = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: context.colors.onSurfaceVariant),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: context.textStyles.bodyMedium.copyWith(
                  color: isValueLink
                      ? context.colors.primary
                      : context.colors.onSurface,
                  fontWeight: FontWeight.w500,
                  decoration: isValueLink ? TextDecoration.underline : null,
                  decorationColor: context.colors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:contrack/src/app/data/models/app_user_model.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class UserProfileDialog extends StatelessWidget {
  final AppUserModel user;

  const UserProfileDialog({super.key, required this.user});

  static Future<void> show(BuildContext context, {required AppUserModel user}) {
    return showDialog(
      context: context,
      builder: (context) => UserProfileDialog(user: user),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.colors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _UserProfileHeader(user: user),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _UserDetailsGrid(user: user),
                    SizedBox(height: 32),
                    Text(
                      'Account Information',
                      style: context.textStyles.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    _UserAccountInfo(user: user),
                  ],
                ),
              ),
            ),
            const _UserProfileFooter(),
          ],
        ),
      ),
    );
  }
}

class _UserProfileHeader extends StatelessWidget {
  const _UserProfileHeader({required this.user});

  final AppUserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 32),
      decoration: BoxDecoration(
        color: context.colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: context.colors.surface.withValues(alpha: 0.2),
                child: Text(
                  user.fullName.initials,
                  style: context.textStyles.headlineSmall.copyWith(
                    color: context.colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName,
                    style: context.textStyles.headlineSmall.copyWith(
                      color: context.colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    user.role.displayName,
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

class _UserDetailsGrid extends StatelessWidget {
  const _UserDetailsGrid({required this.user});

  final AppUserModel user;

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
        value: 'USR-${user.uid.toString().padLeft(3, '0')}',
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

class _UserAccountInfo extends StatelessWidget {
  const _UserAccountInfo({required this.user});

  final AppUserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _UserInfoRow(
            label: 'Account Status',
            valueWidget: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
          _UserInfoRow(
            label: 'Role',
            valueWidget: Text(
              user.role.displayName,
              style: context.textStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Divider(height: 32, color: context.colors.border),
          _UserInfoRow(
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

class _UserInfoRow extends StatelessWidget {
  const _UserInfoRow({required this.label, required this.valueWidget});

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

class _UserProfileFooter extends StatelessWidget {
  const _UserProfileFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
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
                minimumSize: Size.fromHeight(54),
              ),
              child: const Text('Close'),
            ),
          ),
          SizedBox(width: 24),
          Expanded(
            flex: 2,
            child: FilledButton(
              onPressed: () {
                // TODO: Implement Edit Profile
              },
              style: FilledButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                minimumSize: Size.fromHeight(54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Edit Profile'),
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
        SizedBox(width: 12),
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
              SizedBox(height: 4),
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

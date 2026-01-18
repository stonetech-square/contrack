import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/database.dart' as db;
import 'package:contrack/src/features/user_management/presentation/bloc/user_management_bloc.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/user_role_badge.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/user_status_badge.dart';
import 'package:contrack/src/features/user_management/presentation/widgets/user_status_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class UserManagementTableRow extends StatelessWidget {
  const UserManagementTableRow({super.key, required this.user});

  final db.User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.border, width: 0.8),
        ),
      ),
      child: Row(
        children: [
          _DataCell(
            user.fullName ?? user.username,
            flex: 3,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textHeading,
              fontWeight: FontWeight.w500,
            ),
          ),
          _DataCell(user.email, flex: 4),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: UserRoleBadge(role: user.role),
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: UserStatusBadge(isActive: user.isActive),
            ),
          ),
          _DataCell(DateFormat('d MMM yyyy').format(user.createdAt), flex: 2),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  onPressed: () {
                    // TODO: Edit user
                  },
                  color: context.colors.textBody,
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.power_settings_new, size: 18),
                  onPressed: () async {
                    final confirmed = await UserStatusDialog.show(
                      context,
                      user,
                    );
                    if (confirmed == true && context.mounted) {
                      context.read<UserManagementBloc>().add(
                        UserStatusToggled(user),
                      );
                    }
                  },
                  color: user.isActive
                      ? context.colors.error
                      : context.colors.success,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  const _DataCell(this.text, {required this.flex, this.style});

  final String text;
  final int flex;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          text,
          style:
              style ??
              context.textStyles.bodyMedium.copyWith(
                color: context.colors.textBody,
              ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

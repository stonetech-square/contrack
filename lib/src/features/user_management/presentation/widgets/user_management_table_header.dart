import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class UserManagementTableHeader extends StatelessWidget {
  const UserManagementTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        border: Border(
          bottom: BorderSide(color: context.colors.border, width: 0.8),
        ),
      ),
      child: Row(
        children: const [
          _HeaderCell('NAME', flex: 2),
          _HeaderCell('EMAIL', flex: 3),
          _HeaderCell('ROLE', flex: 2),
          _HeaderCell('STATUS', flex: 2),
          _HeaderCell('CREATED', flex: 1),
          _HeaderCell('ACTIONS', flex: 2),
        ],
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  const _HeaderCell(this.text, {required this.flex});

  final String text;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: context.textStyles.labelMedium.copyWith(
          color: context.colors.textSubtle,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}

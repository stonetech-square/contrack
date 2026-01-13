import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class RecentProjectsTableHeader extends StatelessWidget {
  const RecentProjectsTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        border: Border(
          bottom: BorderSide(color: context.colors.border, width: 0.8),
        ),
      ),
      child: Row(
        children: [
          _HeaderCell('S/N', flex: 1),
          _HeaderCell('PROJECT\nCODE', flex: 2),
          _HeaderCell('AGENCY', flex: 4),
          _HeaderCell('STATE', flex: 2),
          _HeaderCell('STATUS', flex: 2),
          _HeaderCell('LAST\nMODIFIED', flex: 2),
          _HeaderCell('SYNC\nSTATUS', flex: 2),
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

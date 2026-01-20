import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AgenciesTableHeader extends StatelessWidget {
  const AgenciesTableHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: context.colors.surfaceVariant,
        border: Border(bottom: BorderSide(color: context.colors.border)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'AGENCY NAME',
              style: context.textStyles.labelSmall.copyWith(
                color: context.colors.textSubtle,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: Text(
              'MINISTRY',
              style: context.textStyles.labelSmall.copyWith(
                color: context.colors.textSubtle,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'CODE',
              style: context.textStyles.labelSmall.copyWith(
                color: context.colors.textSubtle,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 100,
            child: Text(
              'ACTIONS',
              textAlign: TextAlign.end,
              style: context.textStyles.labelSmall.copyWith(
                color: context.colors.textSubtle,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

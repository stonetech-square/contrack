import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';

class CreatNewProjectHeader extends StatelessWidget {
  const CreatNewProjectHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create/Edit Project',
          style: context.textStyles.titleLarge.copyWith(
            color: context.colors.textHeading,
            fontSize: 20,
          ),
        ),
        Text(
          'Enter the details below to track a new constituency project.',
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textSubtle,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

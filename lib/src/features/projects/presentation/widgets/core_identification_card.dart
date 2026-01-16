import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/create_new_project_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoreIdentificationCard extends StatelessWidget {
  const CoreIdentificationCard({
    super.key,
    required this.entry,
    required this.index,
    required this.showErrors,
  });

  final ProjectEntryFormData entry;
  final int index;
  final bool showErrors;

  @override
  Widget build(BuildContext context) {
    return CreatNewProjectEntryCard(
      headerText: 'Core Identification',
      headerIcon: Icons.numbers,
      children: [
        AppTextField(
          label: 'Project Code',
          hintText: entry.code,
          readOnly: true,
          enabled: false,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Auto Generated',
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textSubtle,
                  fontSize: 10,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.lock, color: context.colors.textSubtle, size: 10),
              const SizedBox(width: 12),
            ],
          ),
        ),
        const SizedBox(height: 15),
        AppDropDownField<ProjectStatus>(
          label: 'Status',
          hintText: 'Select Project Status',
          isRequired: true,
          value: entry.status.value,
          items: ProjectStatus.values
              .map(
                (e) => DropdownMenuItem(value: e, child: Text(e.displayName)),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<CreateNewProjectBloc>().add(
                    EntryFieldChanged(index: index, status: value),
                  );
            }
          },
          errorText: showErrors && entry.status.displayError != null
              ? 'Status is required'
              : null,
        ),
      ],
    );
  }
}

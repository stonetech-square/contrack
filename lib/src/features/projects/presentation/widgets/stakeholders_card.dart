import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/create_new_project_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StakeholdersCard extends StatelessWidget {
  const StakeholdersCard({
    super.key,
    required this.state,
    required this.entry,
    required this.index,
    required this.showErrors,
  });

  final CreateNewProjectState state;
  final ProjectEntryFormData entry;
  final int index;
  final bool showErrors;

  @override
  Widget build(BuildContext context) {
    return CreatNewProjectEntryCard(
      headerText: 'Stakeholders',
      headerIcon: Icons.people,
      children: [
        AppDropDownField<int>(
          label: 'Implementing Agency',
          hintText: 'Select an Agency',
          isRequired: true,
          value: entry.implementingAgencyId.value == 0
              ? null
              : entry.implementingAgencyId.value,
          items: state.agencies
              .map((e) => DropdownMenuItem(value: e.id, child: Text(e.name)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<CreateNewProjectBloc>().add(
                    EntryFieldChanged(index: index, implementingAgencyId: value),
                  );
            }
          },
          errorText:
              showErrors && entry.implementingAgencyId.displayError != null
                  ? 'Agency is required'
                  : null,
        ),
        const SizedBox(height: 15),
        AppDropDownField<int>(
          label: 'Supervising Ministry',
          hintText: 'Select Ministry',
          isRequired: true,
          value: entry.supervisingMinistryId.value == 0
              ? null
              : entry.supervisingMinistryId.value,
          items: entry.ministries
              .map((e) => DropdownMenuItem(value: e.id, child: Text(e.name)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<CreateNewProjectBloc>().add(
                    EntryFieldChanged(index: index, supervisingMinistryId: value),
                  );
            }
          },
          errorText:
              showErrors && entry.supervisingMinistryId.displayError != null
                  ? 'Ministry is required'
                  : null,
        ),
      ],
    );
  }
}

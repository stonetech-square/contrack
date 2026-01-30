import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/features/projects/domain/entities/implementing_agency.dart';
import 'package:contrack/src/features/projects/domain/entities/supervising_ministry.dart';
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
        AppSearchableDropDownField<SupervisingMinistry, int>(
          label: 'Supervising Ministry',
          hintText: 'Select Ministry',
          isRequired: true,
          items: state.ministries,
          labelBuilder: (m) => m.name,
          valueBuilder: (m) => m.id,
          value: entry.supervisingMinistryId.value == 0
              ? null
              : entry.supervisingMinistryId.value,
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
        const SizedBox(height: 15),
        AppSearchableDropDownField<ImplementingAgency, int>(
          label: 'Implementing Agency',
          hintText: 'Select an Agency',
          isRequired: true,
          items: entry.agencies,
          labelBuilder: (a) => a.name,
          valueBuilder: (a) => a.id,
          value: entry.implementingAgencyId.value == 0
              ? null
              : entry.implementingAgencyId.value,
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
      ],
    );
  }
}

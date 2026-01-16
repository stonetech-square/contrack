import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/create_new_project_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
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
      headerText: 'Location',
      headerIcon: Icons.location_pin,
      children: [
        AppDropDownField<int>(
          label: 'Geopolitical Zone',
          hintText: 'Select Zone',
          isRequired: true,
          value: entry.geopoliticalZoneId.value == 0
              ? null
              : entry.geopoliticalZoneId.value,
          items: state.zones
              .map((e) => DropdownMenuItem(value: e.id, child: Text(e.name)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<CreateNewProjectBloc>().add(
                    EntryFieldChanged(index: index, geopoliticalZoneId: value),
                  );
            }
          },
          errorText: showErrors && entry.geopoliticalZoneId.displayError != null
              ? 'Zone is required'
              : null,
        ),
        const SizedBox(height: 15),
        AppDropDownField<int>(
          label: 'State',
          hintText: 'Select State',
          isRequired: true,
          value: entry.stateId.value == 0 ? null : entry.stateId.value,
          items: entry.states
              .map((e) => DropdownMenuItem(value: e.id, child: Text(e.name)))
              .toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<CreateNewProjectBloc>().add(
                    EntryFieldChanged(index: index, stateId: value),
                  );
            }
          },
          errorText: showErrors && entry.stateId.displayError != null
              ? 'State is required'
              : null,
        ),
        const SizedBox(height: 15),
        AppTextField(
          key: ValueKey('constituency_${entry.code}'),
          label: 'Constituency',
          hintText: 'Enter Constituency',
          initialValue: entry.constituency.value,
          onChanged: (value) {
            context.read<CreateNewProjectBloc>().add(
                  EntryFieldChanged(index: index, constituency: value),
                );
          },
          errorText: showErrors && entry.constituency.displayError != null
              ? 'Constituency is required'
              : null,
        ),
      ],
    );
  }
}

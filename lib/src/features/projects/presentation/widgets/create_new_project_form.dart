import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/core_identification_card.dart';
import 'package:contrack/src/features/projects/presentation/widgets/location_card.dart';
import 'package:contrack/src/features/projects/presentation/widgets/project_entry_header.dart';
import 'package:contrack/src/features/projects/presentation/widgets/project_entry_tabs.dart';
import 'package:contrack/src/features/projects/presentation/widgets/project_specifics_card.dart';
import 'package:contrack/src/features/projects/presentation/widgets/stakeholders_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewProjectForms extends StatelessWidget {
  const CreateNewProjectForms({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewProjectBloc, CreateNewProjectState>(
      builder: (context, state) {
        final entry = state.currentEntry;
        if (entry == null) {
          return const Center(child: CircularProgressIndicator());
        }
        final index = state.currentEntryIndex;
        final showErrors = state.showErrors;
        return Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.entries.length > 1) ProjectEntryTabs(state: state),
                  ProjectEntryHeader(state: state, entry: entry, index: index),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      CoreIdentificationCard(
                        entry: entry,
                        index: index,
                        showErrors: showErrors,
                      ),
                      StakeholdersCard(
                        state: state,
                        entry: entry,
                        index: index,
                        showErrors: showErrors,
                      ),
                      LocationCard(
                        state: state,
                        entry: entry,
                        index: index,
                        showErrors: showErrors,
                      ),
                      ProjectSpecificsCard(
                        entry: entry,
                        index: index,
                        showErrors: showErrors,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

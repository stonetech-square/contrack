import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/core/utils/currency_formatter.dart';
import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/create_new_project_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProjectSpecificsCard extends StatelessWidget {
  const ProjectSpecificsCard({
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
    final dateFormat = DateFormat('MM/dd/yyyy');

    return CreatNewProjectEntryCard(
      headerText: 'Project Specifics',
      headerIcon: Icons.file_copy,
      children: [
        AppTextField(
          key: ValueKey('title_${entry.code}'),
          label: 'Project Title',
          hintText: 'Enter Project Title',
          isRequired: true,
          initialValue: entry.title.value,
          onChanged: (value) {
            context.read<CreateNewProjectBloc>().add(
              EntryFieldChanged(index: index, title: value),
            );
          },
          errorText: showErrors && entry.title.displayError != null
              ? 'Title is required'
              : null,
        ),
        const SizedBox(height: 15),
        AppTextField(
          key: ValueKey('sponsor_${entry.code}'),
          label: 'Project Sponsor',
          hintText: 'Enter Project Sponsor',
          initialValue: entry.sponsor,
          onChanged: (value) {
            context.read<CreateNewProjectBloc>().add(
              EntryFieldChanged(index: index, sponsor: value),
            );
          },
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: AppTextField(
                key: ValueKey('budget_${entry.code}'),
                label: 'Budget Allocation',
                hintText: '₦',
                initialValue: entry.budget.value > 0
                    ? NumberFormat.decimalPattern().format(entry.budget.value)
                    : null,
                keyboardType: TextInputType.number,
                inputFormatters: [CurrencyInputFormatter()],
                onChanged: (value) {
                  final cleanValue = value.replaceAll(',', '');
                  final budget = double.tryParse(cleanValue) ?? 0.0;
                  context.read<CreateNewProjectBloc>().add(
                    EntryFieldChanged(index: index, budget: budget),
                  );
                },
                errorText: showErrors && entry.budget.displayError != null
                    ? 'Invalid budget'
                    : null,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: entry.startDate.value ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null && context.mounted) {
                    context.read<CreateNewProjectBloc>().add(
                      EntryFieldChanged(index: index, startDate: date),
                    );
                  }
                },
                child: AbsorbPointer(
                  child: AppTextField(
                    label: 'Start Date',
                    hintText: entry.startDate.value != null
                        ? dateFormat.format(entry.startDate.value!)
                        : 'MM/DD/YYYY',
                    errorText:
                        showErrors && entry.startDate.displayError != null
                        ? 'Required'
                        : null,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: entry.endDate.value ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (date != null && context.mounted) {
                    context.read<CreateNewProjectBloc>().add(
                      EntryFieldChanged(index: index, endDate: date),
                    );
                  }
                },
                child: AbsorbPointer(
                  child: AppTextField(
                    label: 'End Date',
                    hintText: entry.endDate.value != null
                        ? dateFormat.format(entry.endDate.value!)
                        : 'MM/DD/YYYY',
                    errorText: showErrors && entry.endDate.displayError != null
                        ? 'Required'
                        : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

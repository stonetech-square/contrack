import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:contrack/src/features/projects/presentation/widgets/create_new_project_entry_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewProjectForm extends StatelessWidget {
  const CreateNewProjectForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewProjectBloc, CreateNewProjectState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      CreatNewProjectEntryCard(
                        headerText: 'Core Identification',
                        headerIcon: Icons.numbers,
                        children: [
                          AppTextField(
                            label: 'Project Code',
                            hintText: state.projectCode,
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
                                SizedBox(width: 8),
                                Icon(
                                  Icons.lock,
                                  color: context.colors.textSubtle,
                                  size: 10,
                                ),
                                SizedBox(width: 12),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          AppDropDownField<ProjectStatus>(
                            label: 'Status',
                            hintText: 'Select Project Status',
                            isRequired: true,
                            value: state.status.value,
                            items: ProjectStatus.values
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.displayName),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              if (value != null) {
                                context.read<CreateNewProjectBloc>().add(
                                  CreateNewProjectStatusChangedEvent(
                                    status: value,
                                  ),
                                );
                              }
                            },
                            errorText: state.status.displayError != null
                                ? 'Status is required'
                                : null,
                          ),
                        ],
                      ),
                      CreatNewProjectEntryCard(
                        headerText: 'Stakeholders',
                        headerIcon: Icons.people,
                        children: [
                          AppDropDownField<int>(
                            label: 'Implementing Agency',
                            hintText: 'Select an Agency',
                            isRequired: true,
                            value: state.implementingAgencyId.value == 0
                                ? null
                                : state.implementingAgencyId.value,
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text('Agency A'),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text('Agency B'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                context.read<CreateNewProjectBloc>().add(
                                  CreateNewProjectImplementingAgencyChangedEvent(
                                    implementingAgencyId: value,
                                  ),
                                );
                              }
                            },
                            errorText:
                                state.implementingAgencyId.displayError != null
                                ? 'Agency is required'
                                : null,
                          ),
                          SizedBox(height: 15),
                          AppDropDownField<int>(
                            label: 'Supervising Ministry',
                            hintText: 'Select Ministry',
                            isRequired: true,
                            value: state.supervisingMinistryId.value == 0
                                ? null
                                : state.supervisingMinistryId.value,
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text('Ministry A'),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text('Ministry B'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                context.read<CreateNewProjectBloc>().add(
                                  CreateNewProjectSupervisingMinistryChangedEvent(
                                    supervisingMinistryId: value,
                                  ),
                                );
                              }
                            },
                            errorText:
                                state.supervisingMinistryId.displayError != null
                                ? 'Ministry is required'
                                : null,
                          ),
                        ],
                      ),
                      CreatNewProjectEntryCard(
                        headerText: 'Location',
                        headerIcon: Icons.location_pin,
                        children: [
                          AppDropDownField<int>(
                            label: 'Geopolitical Zone',
                            hintText: 'Select Zone',
                            isRequired: true,
                            value: state.geopoliticalZoneId.value == 0
                                ? null
                                : state.geopoliticalZoneId.value,
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text('South West'),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text('North Central'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                context.read<CreateNewProjectBloc>().add(
                                  CreateNewProjectGeopoliticalZoneChangedEvent(
                                    geopoliticalZoneId: value,
                                  ),
                                );
                              }
                            },
                            errorText:
                                state.geopoliticalZoneId.displayError != null
                                ? 'Zone is required'
                                : null,
                          ),
                          SizedBox(height: 15),
                          AppDropDownField<int>(
                            label: 'State',
                            hintText: 'Select State',
                            isRequired: true,
                            value: state.stateId.value == 0
                                ? null
                                : state.stateId.value,
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text('Lago State'),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text('Abuja FCT'),
                              ),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                context.read<CreateNewProjectBloc>().add(
                                  CreateNewProjectStateChangedEvent(
                                    stateId: value,
                                  ),
                                );
                              }
                            },
                            errorText: state.stateId.displayError != null
                                ? 'State is required'
                                : null,
                          ),
                          SizedBox(height: 15),

                          AppTextField(
                            label: 'Constituency',
                            hintText: 'Enter Constituency',
                            initialValue: state.constituency.value,
                            onChanged: (value) {
                              context.read<CreateNewProjectBloc>().add(
                                CreateNewProjectConstituencyChangedEvent(
                                  constituency: value,
                                ),
                              );
                            },
                            errorText: state.constituency.displayError != null
                                ? 'Constituency is required'
                                : null,
                          ),
                        ],
                      ),
                      CreatNewProjectEntryCard(
                        headerText: 'Project Specifics',
                        headerIcon: Icons.file_copy,
                        children: [
                          AppTextField(
                            label: 'Project Title',
                            hintText: 'Enter Project Title',
                            isRequired: true,
                            initialValue: state.title.value,
                            onChanged: (value) {
                              context.read<CreateNewProjectBloc>().add(
                                CreateNewProjectTitleChangedEvent(title: value),
                              );
                            },
                            errorText: state.title.displayError != null
                                ? 'Title is required'
                                : null,
                          ),
                          SizedBox(height: 15),
                          AppTextField(
                            label: 'Project Sponsor',
                            hintText: 'Enter Project Sponsor',
                            initialValue: state.sponsor,
                            onChanged: (value) {
                              context.read<CreateNewProjectBloc>().add(
                                CreateNewProjectSponsorChangedEvent(
                                  sponsor: value,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: AppTextField(
                                  label: 'Budget Allocation',
                                  hintText: 'N',
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    final budget =
                                        double.tryParse(value) ?? 0.0;
                                    context.read<CreateNewProjectBloc>().add(
                                      CreateNewProjectBugetChangedEvent(
                                        budget: budget,
                                      ),
                                    );
                                  },
                                  errorText: state.budget.displayError != null
                                      ? 'Invalid budget'
                                      : null,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (date != null && context.mounted) {
                                      context.read<CreateNewProjectBloc>().add(
                                        CreateNewProjectStartDateChangedEvent(
                                          startDate: date,
                                        ),
                                      );
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: AppTextField(
                                      label: 'Start Date',
                                      hintText:
                                          state.startDate.value?.toString() ??
                                          'MM/DD/YYYY',
                                      errorText:
                                          state.startDate.displayError != null
                                          ? 'Required'
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (date != null && context.mounted) {
                                      context.read<CreateNewProjectBloc>().add(
                                        CreateNewProjectEndDateChangedEvent(
                                          endDate: date,
                                        ),
                                      );
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: AppTextField(
                                      label: 'End Date',
                                      hintText:
                                          state.endDate.value?.toString() ??
                                          'MM/DD/YYYY',
                                      errorText:
                                          state.endDate.displayError != null
                                          ? 'Required'
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

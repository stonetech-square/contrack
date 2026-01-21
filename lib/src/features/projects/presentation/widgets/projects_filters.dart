import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/features/projects/domain/entities/sort_field.dart';
import 'package:contrack/src/features/projects/presentation/bloc/all_projects_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsFilters extends StatelessWidget {
  const ProjectsFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: AppTextField(
            hintText: 'Search by code, agency, ministry, state...',
            prefixIcon: Icon(Icons.search, color: context.colors.textSubtle),
            onChanged: (value) {
              context.read<AllProjectsBloc>().add(
                AllProjectsWatchStarted(
                  query: value,
                  filter: const ProjectFilter(
                    sortField: ProjectSortField.updatedAt,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectEntryHeader extends StatelessWidget {
  const ProjectEntryHeader({
    super.key,
    required this.state,
    required this.entry,
    required this.index,
  });

  final CreateNewProjectState state;
  final ProjectEntryFormData entry;
  final int index;

  @override
  Widget build(BuildContext context) {
    final canRemove = state.entries.length > 1;
    final title = entry.title.value.isNotEmpty
        ? entry.title.value
        : '(${index + 1}) ${entry.code}';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textStyles.titleLarge.copyWith(
            color: context.colors.textHeading,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.underline,
          ),
        ),
        if (canRemove)
          TextButton.icon(
            onPressed: () =>
                context.read<CreateNewProjectBloc>().add(EntryRemoved(index)),
            icon: Icon(
              Icons.delete_outline,
              size: 18,
              color: context.colors.error,
            ),
            label: Text(
              'Remove Entry',
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.error,
              ),
            ),
          ),
      ],
    );
  }
}

import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/features/projects/presentation/bloc/create_new_project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewProjectAction extends StatelessWidget {
  const CreateNewProjectAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateNewProjectBloc, CreateNewProjectState>(
      buildWhen: (previous, current) =>
          previous.viewStatus != current.viewStatus ||
          previous.showErrors != current.showErrors ||
          previous.isValid != current.isValid ||
          previous.entries.length != current.entries.length,
      builder: (context, state) {
        final isSubmitting =
            state.viewStatus == CreateProjectViewStatus.submitting;

        return Row(
          children: [
            FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size(240, 44.28),
                maximumSize: const Size(250, 44.28),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: context.colors.border, width: 1),
                ),
              ),
              onPressed: () =>
                  context.read<CreateNewProjectBloc>().add(const EntryAdded()),
              icon: const Icon(Icons.add),
              label: const Text('Add Another Project Entry'),
            ),
            const SizedBox(width: 16),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size(110, 44.28),
                maximumSize: const Size(120, 44.28),
                backgroundColor: context.colors.neutralInverted,
                foregroundColor: context.colors.textHeading,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: context.colors.border, width: 1),
                ),
              ),
              label: const Text('Cancel'),
              icon: const Icon(Icons.close),
              onPressed: () => context.read<CreateNewProjectBloc>().add(
                const CreateNewProjectCancelled(),
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size(130, 44.28),
                maximumSize: const Size(140, 44.28),
                backgroundColor: context.colors.primary,
                foregroundColor: context.colors.neutralInverted,
                disabledBackgroundColor: context.colors.primary.withValues(
                  alpha: 0.5,
                ),
                disabledForegroundColor: context.colors.neutralInverted
                    .withValues(alpha: 0.5),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: context.colors.border, width: 1),
                ),
              ),
              label: isSubmitting
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.colors.neutralInverted,
                      ),
                    )
                  : Text(
                      state.entries.length > 1
                          ? 'Save (${state.entries.length})'
                          : 'Save',
                    ),
              icon: isSubmitting
                  ? const SizedBox.shrink()
                  : const Icon(Icons.save),
              onPressed: state.isValid && !isSubmitting
                  ? () => context.read<CreateNewProjectBloc>().add(
                      const CreateNewProjectSubmitted(),
                    )
                  : null,
            ),
          ],
        );
      },
    );
  }
}

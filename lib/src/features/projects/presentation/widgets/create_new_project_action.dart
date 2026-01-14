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
          previous.isValid != current.isValid,
      builder: (context, state) {
        return Row(
          children: [
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
              label: Text('Cancel'),
              icon: Icon(Icons.close),
              onPressed: () => context.read<CreateNewProjectBloc>().add(
                const CreateNewProjectCancelledEvent(),
              ),
            ),
            SizedBox(width: 12),
            FilledButton.icon(
              style: FilledButton.styleFrom(
                minimumSize: const Size(110, 44.28),
                maximumSize: const Size(120, 44.28),
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
              label: state.viewStatus == CreateProjectViewStatus.submitting
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.colors.neutralInverted,
                      ),
                    )
                  : Text('Create'),
              icon: state.viewStatus == CreateProjectViewStatus.submitting
                  ? SizedBox.shrink()
                  : Icon(Icons.save),
              onPressed:
                  state.isValid &&
                      state.viewStatus != CreateProjectViewStatus.submitting
                  ? () {
                      context.read<CreateNewProjectBloc>().add(
                        const CreateNewProjectSubmittedEvent(),
                      );
                    }
                  : null,
            ),
          ],
        );
      },
    );
  }
}

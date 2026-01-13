import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:contrack/src/core/database/database.dart' hide State;
import 'package:contrack/src/core/session/user_session.dart';
import 'package:contrack/src/core/utils/project_code_generator.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:contrack/src/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:contrack/src/features/dashboard/presentation/utils/test_project_creator.dart';
import 'package:contrack/src/features/dashboard/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetIt.I.get<DashboardBloc>()..add(DashboardStarted()),
      child: const DashboardView(),
    );
  }
}

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  Future<void> _createTestProject() async {
    if (!mounted) return;

    final database = GetIt.I.get<AppDatabase>();
    final userSession = GetIt.I.get<UserSession>();
    final codeGenerator = GetIt.I.get<ProjectCodeGenerator>();
    final creator = TestProjectCreator(database, codeGenerator);

    try {
      // Get current user
      final user = userSession.currentUser;
      if (user == null) {
        if (mounted) {
          _showSnackBar('Error: No user logged in', isError: true);
        }
        return;
      }

      if (mounted) {
        _showSnackBar('Creating test project...');
      }

      // Seed reference data if needed (first time)
      await creator.seedReferenceDataIfNeeded();

      // Create test project
      final projectId = await creator.createTestProject(
        userId: user.id,
        userUid: user.uid,
        agencyId: 1,
        ministryId: 1,
        stateId: 1,
        zoneId: 1,
      );

      if (mounted) {
        _showSnackBar(
          'Test project created successfully! (ID: $projectId)',
          isSuccess: true,
        );
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar('Error creating project: $e', isError: true);
      }
    }
  }

  void _showSnackBar(
    String message, {
    bool isError = false,
    bool isSuccess = false,
  }) {
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError
            ? Colors.red
            : isSuccess
            ? Colors.green
            : null,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dashboard',
          style: context.textStyles.titleMedium.copyWith(
            color: context.colors.textSubtle,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 23),
        DashboardOverView(),
        SizedBox(height: 44),
        FilledButton.icon(
          onPressed: _createTestProject,
          style: FilledButton.styleFrom(
            maximumSize: const Size(230, 56),
            minimumSize: const Size(200, 56),
          ),
          icon: const Icon(Icons.add_circle_outline_rounded),
          label: const Text('Add New Project Entry'),
        ),
        SizedBox(height: 32),
        Expanded(flex: 20, child: RecentProjects()),
        Expanded(flex: 1, child: SizedBox()),
      ],
    );
  }
}

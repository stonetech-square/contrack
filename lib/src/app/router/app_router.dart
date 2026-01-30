import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:contrack/src/app/presentation/screen/app_root_screen.dart';
import 'package:contrack/src/app/presentation/screen/auhtenticated_main_screen.dart';
import 'package:contrack/src/app/presentation/screen/authenticated_shell_screen.dart';
import 'package:contrack/src/app/presentation/screen/un_authenticated_shell_screen.dart';
import 'package:contrack/src/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:contrack/src/features/dashboard/domain/entities/project.dart';
import 'package:contrack/src/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:contrack/src/features/master_data/presentation/screens/master_data_screen.dart';
import 'package:contrack/src/features/projects/presentation/screens/all_project_screen.dart';
import 'package:contrack/src/features/projects/presentation/screens/create_new_project_screen.dart';
import 'package:contrack/src/features/projects/presentation/screens/project_screen.dart';
import 'package:contrack/src/features/projects/presentation/screens/shell_project_screen.dart';
import 'package:contrack/src/features/reports/presentation/screen/report_screen.dart';
import 'package:contrack/src/features/seeding/presentation/screen/seeding_screen.dart';
import 'package:contrack/src/features/user_management/presentation/screens/create_user_screen.dart';
import 'package:contrack/src/features/user_management/presentation/screens/user_list_screen.dart';
import 'package:contrack/src/features/user_management/presentation/screens/user_management_screen.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom();
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: AppRootRoute.page,
      children: [
        AutoRoute(
          page: UnAuthenticatedShellRoute.page,
          initial: true,
          children: [AutoRoute(page: SignInRoute.page, initial: true)],
        ),
        AutoRoute(
          page: AuthenticatedShellRoute.page,
          children: [
            AutoRoute(page: SeedingRoute.page, initial: true),
            AutoRoute(
              page: AuhtenticatedMainRoute.page,
              children: [
                AutoRoute(page: DashboardRoute.page),
                // TODO: fix shell routing bug
                AutoRoute(
                  page: ShellProjectRoute.page,
                  children: [
                    AutoRoute(page: AllProjectRoute.page, initial: true),
                    AutoRoute(page: ProjectRoute.page),
                    AutoRoute(page: CreateNewProjectRoute.page),
                  ],
                ),
                // AutoRoute(page: ReportRoute.page),
                AutoRoute(
                  page: UserManagementRoute.page,
                  children: [
                    AutoRoute(page: UserListRoute.page, initial: true),
                    AutoRoute(page: CreateUserRoute.page),
                  ],
                ),
                AutoRoute(page: MasterDataRoute.page),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}

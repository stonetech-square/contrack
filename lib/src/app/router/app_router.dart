import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/screen/app_root_screen.dart';
import 'package:contrack/src/app/presentation/screen/authenticated_shell_screen.dart';
import 'package:contrack/src/app/presentation/screen/un_authenticated_shell_screen.dart';
import 'package:contrack/src/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:contrack/src/features/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:contrack/src/features/projects/presentation/screens/all_project_screen.dart';
import 'package:contrack/src/features/projects/presentation/screens/create_new_project.dart';
import 'package:contrack/src/features/projects/presentation/screens/project_screen.dart';
import 'package:contrack/src/features/reports/presentation/screen/report_screen.dart';
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
          children: [AutoRoute(page: SignInRoute.page, initial: true)],
        ),
        AutoRoute(
          page: AuthenticatedShellRoute.page,
          children: [
            AutoRoute(page: DashboardRoute.page),
            AutoRoute(
              page: AllProjectRoute.page,
              children: [
                AutoRoute(page: ProjectRoute.page),
                AutoRoute(page: CreateNewProjectRoute.page),
              ],
            ),
            AutoRoute(page: ReportRoute.page),
          ],
        ),
      ],
    ),
  ];
}

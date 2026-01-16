import 'package:auto_route/auto_route.dart';
import 'package:contrack/src/app/presentation/bloc/app_bloc.dart';
import 'package:contrack/src/app/presentation/constants/app_destination_enum.dart';

import 'package:contrack/src/app/presentation/widgets/widgets.dart';
import 'package:contrack/src/app/router/app_router.dart';
import 'package:contrack/src/app/theme/app_colors.dart';
import 'package:contrack/src/app/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AuthenticatedShellScreen extends StatelessWidget {
  const AuthenticatedShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) =>
          previous.user != current.user ||
          previous.syncStatus != current.syncStatus,
      builder: (context, state) {
        return AutoTabsRouter(
          routes: [
            const DashboardRoute(),
            const ShellProjectRoute(),
            if (state.user?.role.isAnyAdmin ?? false) ...[const ReportRoute()],
          ],
          lazyLoad: false,
          transitionBuilder: (context, child, animation) =>
              FadeTransition(opacity: animation, child: child),
          builder: (context, child) {
            final tabsRouter = AutoTabsRouter.of(context);
            return Scaffold(
              body: Row(
                children: [
                  AppSidebar(
                    selectedIndex: tabsRouter.activeIndex,
                    onDestinationSelected: (index) {
                      final currentRouter = tabsRouter.stackRouterOfIndex(
                        tabsRouter.activeIndex,
                      );
                      if (currentRouter != null && currentRouter.canPop()) {
                        currentRouter.popUntilRoot();
                      }
                      tabsRouter.setActiveIndex(index);
                    },
                    destinations: [
                      AppSidebarDestination.dashboard,
                      AppSidebarDestination.projects,
                      if (state.user?.role.isAnyAdmin ?? false) ...[
                        AppSidebarDestination.reports,
                        AppSidebarDestination.syncStatus,
                        AppSidebarDestination.userManagement,
                        AppSidebarDestination.masterData,
                      ],
                    ],
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            color: context.colors.card,
                            border: Border(
                              bottom: BorderSide(color: context.colors.divider),
                            ),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Project Management System',
                                style: context.textStyles.titleMedium,
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  OnlineIndicator(
                                    status: state.syncStatus,
                                    onTap: () {
                                      context.read<AppBloc>().add(
                                        const AppSyncRequested(),
                                      );
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                  UserProfileButton(user: state.user),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32.0,
                            ),
                            child: child,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

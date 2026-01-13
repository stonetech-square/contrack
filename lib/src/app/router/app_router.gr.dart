// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AllProjectScreen]
class AllProjectRoute extends PageRouteInfo<void> {
  const AllProjectRoute({List<PageRouteInfo>? children})
    : super(AllProjectRoute.name, initialChildren: children);

  static const String name = 'AllProjectRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AllProjectScreen();
    },
  );
}

/// generated route for
/// [AppRootScreen]
class AppRootRoute extends PageRouteInfo<void> {
  const AppRootRoute({List<PageRouteInfo>? children})
    : super(AppRootRoute.name, initialChildren: children);

  static const String name = 'AppRootRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AppRootScreen();
    },
  );
}

/// generated route for
/// [AuthenticatedShellScreen]
class AuthenticatedShellRoute extends PageRouteInfo<void> {
  const AuthenticatedShellRoute({List<PageRouteInfo>? children})
    : super(AuthenticatedShellRoute.name, initialChildren: children);

  static const String name = 'AuthenticatedShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthenticatedShellScreen();
    },
  );
}

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [ProjectScreen]
class ProjectRoute extends PageRouteInfo<ProjectRouteArgs> {
  ProjectRoute({
    Key? key,
    required int projectId,
    List<PageRouteInfo>? children,
  }) : super(
         ProjectRoute.name,
         args: ProjectRouteArgs(key: key, projectId: projectId),
         initialChildren: children,
       );

  static const String name = 'ProjectRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectRouteArgs>();
      return ProjectScreen(key: args.key, projectId: args.projectId);
    },
  );
}

class ProjectRouteArgs {
  const ProjectRouteArgs({this.key, required this.projectId});

  final Key? key;

  final int projectId;

  @override
  String toString() {
    return 'ProjectRouteArgs{key: $key, projectId: $projectId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProjectRouteArgs) return false;
    return key == other.key && projectId == other.projectId;
  }

  @override
  int get hashCode => key.hashCode ^ projectId.hashCode;
}

/// generated route for
/// [ReportScreen]
class ReportRoute extends PageRouteInfo<void> {
  const ReportRoute({List<PageRouteInfo>? children})
    : super(ReportRoute.name, initialChildren: children);

  static const String name = 'ReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReportScreen();
    },
  );
}

/// generated route for
/// [SignInScreen]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInScreen();
    },
  );
}

/// generated route for
/// [UnAuthenticatedShellScreen]
class UnAuthenticatedShellRoute extends PageRouteInfo<void> {
  const UnAuthenticatedShellRoute({List<PageRouteInfo>? children})
    : super(UnAuthenticatedShellRoute.name, initialChildren: children);

  static const String name = 'UnAuthenticatedShellRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UnAuthenticatedShellScreen();
    },
  );
}

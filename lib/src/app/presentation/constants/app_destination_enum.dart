import 'package:flutter/material.dart';

enum AppSidebarDestination {
  dashboard,
  projects,
  reports,
  syncStatus,
  userManagement,
  masterData;

  String displayName() {
    switch (this) {
      case AppSidebarDestination.dashboard:
        return 'Dashboard';
      case AppSidebarDestination.projects:
        return 'Projects';
      case AppSidebarDestination.reports:
        return 'Reports';
      case AppSidebarDestination.syncStatus:
        return 'Sync Status';
      case AppSidebarDestination.userManagement:
        return 'User Management';
      case AppSidebarDestination.masterData:
        return 'Master Data';
    }
  }

  IconData get icon {
    switch (this) {
      case AppSidebarDestination.dashboard:
        return Icons.dashboard;
      case AppSidebarDestination.projects:
        return Icons.folder;
      case AppSidebarDestination.reports:
        return Icons.receipt;
      case AppSidebarDestination.syncStatus:
        return Icons.sync;
      case AppSidebarDestination.userManagement:
        return Icons.people;
      case AppSidebarDestination.masterData:
        return Icons.data_object;
    }
  }
}

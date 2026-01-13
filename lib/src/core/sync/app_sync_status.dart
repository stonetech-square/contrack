enum AppSyncStatus {
  online,
  offline,
  syncing;

  bool get isOnline => this == AppSyncStatus.online;
  bool get isOffline => this == AppSyncStatus.offline;
  bool get isSyncing => this == AppSyncStatus.syncing;
}

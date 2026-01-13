enum ProjectStatus {
  notStarted,
  ongoing,
  completed,
  suspended,
  cancelled;

  String get displayName {
    switch (this) {
      case ProjectStatus.notStarted:
        return 'Not Started';
      case ProjectStatus.ongoing:
        return 'Ongoing';
      case ProjectStatus.completed:
        return 'Completed';
      case ProjectStatus.suspended:
        return 'Suspended';
      case ProjectStatus.cancelled:
        return 'Cancelled';
    }
  }
}

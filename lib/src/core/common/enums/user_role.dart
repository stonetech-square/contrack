enum UserRole {
  superAdmin,
  admin,
  regular;

  String get displayName {
    switch (this) {
      case UserRole.superAdmin:
        return 'Super Admin';
      case UserRole.admin:
        return 'Administrator';
      case UserRole.regular:
        return 'Member';
    }
  }
}

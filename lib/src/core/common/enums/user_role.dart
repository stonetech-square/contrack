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

  bool get isSuperAdmin => this == UserRole.superAdmin;
  bool get isAdmin => this == UserRole.admin;
  bool get isRegular => this == UserRole.regular;

  bool get isAnyAdmin => isSuperAdmin || isAdmin;
}

enum ExportType {
  preferred,
  extra;

  String get displayName {
    switch (this) {
      case ExportType.preferred:
        return 'Official Use (Compact)';
      case ExportType.extra:
        return 'Data Transfer (Full)';
    }
  }

  String get description {
    switch (this) {
      case ExportType.preferred:
        return 'Contains essential columns: S/No, Code, Title, Status, Amount, Agency, and Ministry.';
      case ExportType.extra:
        return 'Contains all available project data columns. Suitable for data backup or transfer purposes.';
    }
  }
}

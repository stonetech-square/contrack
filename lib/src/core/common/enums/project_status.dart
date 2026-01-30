import 'package:json_annotation/json_annotation.dart';

enum InHouseStatus {
  notStarted,
  ongoing,
  completed,
  suspended,
  cancelled;

  String get displayName {
    switch (this) {
      case InHouseStatus.notStarted:
        return 'Not Started';
      case InHouseStatus.ongoing:
        return 'Ongoing';
      case InHouseStatus.completed:
        return 'Completed';
      case InHouseStatus.suspended:
        return 'Suspended';
      case InHouseStatus.cancelled:
        return 'Cancelled';
    }
  }
}

enum ProjectStatus {
  @JsonValue('new')
  newProject,
  @JsonValue('ongoing')
  ongoing;

  String get displayName {
    switch (this) {
      case ProjectStatus.newProject:
        return 'New';
      case ProjectStatus.ongoing:
        return 'Ongoing';
    }
  }

  String get supabaseValue {
    switch (this) {
      case ProjectStatus.newProject:
        return 'new';
      case ProjectStatus.ongoing:
        return 'ongoing';
    }
  }
}

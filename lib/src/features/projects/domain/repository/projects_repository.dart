import 'package:contrack/src/core/common/enums/project_status.dart';

abstract class ProjectsRepository {
  String generateProjectCode({DateTime? date});
  Future<void> createProject({
    required String code,
    required ProjectStatus status,
    required int agencyId,
    required int ministryId,
    required int stateId,
    required int zoneId,
    required String constituency,
    required String title,
    required double amount,
    String? sponsor,
    required DateTime startDate,
    required DateTime endDate,
  });
}

import 'package:injectable/injectable.dart';

@lazySingleton
class ProjectCodeGenerator {
  String generate(String userUid, DateTime timestamp) {
    final year = timestamp.year;
    final userHash = userUid.hashCode.abs() % 10000;
    final sequence = timestamp.millisecondsSinceEpoch % 1000;
    return 'CPMS-$year-${userHash.toString().padLeft(4, '0')}-${sequence.toString().padLeft(3, '0')}';
  }
}

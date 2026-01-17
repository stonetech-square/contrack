import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class PickProjectFileUseCase implements UseCase<Future<String?>, NoParams> {
  final DashboardRepository _repository;

  PickProjectFileUseCase(this._repository);

  @override
  Future<String?> call(NoParams params) async {
    return _repository.pickProjectFile();
  }
}

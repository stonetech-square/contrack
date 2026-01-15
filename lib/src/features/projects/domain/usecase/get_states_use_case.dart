import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/projects/domain/entities/nigerian_state.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetStatesUseCase implements UseCase<Future<List<NigerianState>>, int> {
  final ProjectsRepository _repository;

  GetStatesUseCase(this._repository);

  @override
  Future<List<NigerianState>> call(int zoneId) async {
    return _repository.getStates(zoneId);
  }
}

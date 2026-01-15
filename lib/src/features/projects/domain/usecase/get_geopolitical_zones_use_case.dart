import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/projects/domain/entities/geopolitical_zone.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetGeopoliticalZonesUseCase
    implements UseCase<Future<List<GeopoliticalZone>>, NoParams> {
  final ProjectsRepository _repository;

  GetGeopoliticalZonesUseCase(this._repository);

  @override
  Future<List<GeopoliticalZone>> call(NoParams params) async {
    return _repository.getGeopoliticalZones();
  }
}

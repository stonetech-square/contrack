import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/projects/domain/entities/supervising_ministry.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSupervisingMinistriesUseCase
    implements UseCase<Future<List<SupervisingMinistry>>, NoParams> {
  final ProjectsRepository _repository;

  GetSupervisingMinistriesUseCase(this._repository);

  @override
  Future<List<SupervisingMinistry>> call(NoParams params) async {
    return _repository.getSupervisingMinistries();
  }
}

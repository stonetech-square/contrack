import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/projects/domain/entities/implementing_agency.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetImplementingAgenciesUseCase
    implements UseCase<Future<List<ImplementingAgency>>, NoParams> {
  final ProjectsRepository _repository;

  GetImplementingAgenciesUseCase(this._repository);

  @override
  Future<List<ImplementingAgency>> call(NoParams params) async {
    return _repository.getImplementingAgencies();
  }
}

import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GenerateProjectCodeUseCase
    implements UseCase<String, GenerateProjectCodeParams> {
  final ProjectsRepository _repository;

  GenerateProjectCodeUseCase(this._repository);

  @override
  String call(GenerateProjectCodeParams params) {
    return _repository.generateProjectCode(date: params.date);
  }
}

class GenerateProjectCodeParams extends Equatable {
  final DateTime? date;

  const GenerateProjectCodeParams({this.date});

  @override
  List<Object?> get props => [date];
}

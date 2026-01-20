import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteMinistryUseCase
    implements UseCase<Future<void>, DeleteMinistryParams> {
  final MasterDataRepository _repository;

  DeleteMinistryUseCase(this._repository);

  @override
  Future<void> call(DeleteMinistryParams params) {
    return _repository.deleteMinistry(params.ministry);
  }
}

class DeleteMinistryParams extends Equatable {
  final Ministry ministry;

  const DeleteMinistryParams(this.ministry);

  @override
  List<Object?> get props => [ministry];
}

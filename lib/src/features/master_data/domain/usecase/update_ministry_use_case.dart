import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateMinistryUseCase
    implements UseCase<Future<void>, UpdateMinistryParams> {
  final MasterDataRepository _repository;

  UpdateMinistryUseCase(this._repository);

  @override
  Future<void> call(UpdateMinistryParams params) {
    return _repository.updateMinistry(params.ministry);
  }
}

class UpdateMinistryParams extends Equatable {
  final Ministry ministry;

  const UpdateMinistryParams(this.ministry);

  @override
  List<Object?> get props => [ministry];
}

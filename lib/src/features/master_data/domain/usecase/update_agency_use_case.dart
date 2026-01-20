import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateAgencyUseCase implements UseCase<Future<void>, UpdateAgencyParams> {
  final MasterDataRepository _repository;

  UpdateAgencyUseCase(this._repository);

  @override
  Future<void> call(UpdateAgencyParams params) {
    return _repository.updateAgency(params.agency);
  }
}

class UpdateAgencyParams extends Equatable {
  final Agency agency;

  const UpdateAgencyParams(this.agency);

  @override
  List<Object?> get props => [agency];
}

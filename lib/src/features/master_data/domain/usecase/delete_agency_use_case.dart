import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteAgencyUseCase implements UseCase<Future<void>, DeleteAgencyParams> {
  final MasterDataRepository _repository;

  DeleteAgencyUseCase(this._repository);

  @override
  Future<void> call(DeleteAgencyParams params) {
    return _repository.deleteAgency(params.agency);
  }
}

class DeleteAgencyParams extends Equatable {
  final Agency agency;

  const DeleteAgencyParams(this.agency);

  @override
  List<Object?> get props => [agency];
}

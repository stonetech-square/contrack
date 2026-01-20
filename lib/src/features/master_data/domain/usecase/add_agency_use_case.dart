import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddAgencyUseCase implements UseCase<Future<void>, AddAgencyParams> {
  final MasterDataRepository _repository;

  AddAgencyUseCase(this._repository);

  @override
  Future<void> call(AddAgencyParams params) {
    return _repository.addAgency(params.agency);
  }
}

class AddAgencyParams extends Equatable {
  final Agency agency;

  const AddAgencyParams(this.agency);

  @override
  List<Object?> get props => [agency];
}

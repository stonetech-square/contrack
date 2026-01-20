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
    return _repository.addAgency(
      name: params.name,
      code: params.code,
      ministryId: params.ministryId,
      ministryRemoteId: params.ministryRemoteId,
    );
  }
}

class AddAgencyParams extends Equatable {
  final String name;
  final String code;
  final int ministryId;
  final String ministryRemoteId;

  const AddAgencyParams({
    required this.name,
    required this.code,
    required this.ministryId,
    required this.ministryRemoteId,
  });

  @override
  List<Object?> get props => [name, code, ministryId, ministryRemoteId];
}

import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/master_data/domain/repository/master_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddMinistryUseCase implements UseCase<Future<void>, AddMinistryParams> {
  final MasterDataRepository _repository;

  AddMinistryUseCase(this._repository);

  @override
  Future<void> call(AddMinistryParams params) {
    return _repository.addMinistry(
      name: params.name,
      code: params.code,
      agencyId: params.agencyId,
      agencyRemoteId: params.agencyRemoteId,
    );
  }
}

class AddMinistryParams extends Equatable {
  final String name;
  final String code;
  final int agencyId;
  final String agencyRemoteId;

  const AddMinistryParams({
    required this.name,
    required this.code,
    required this.agencyId,
    required this.agencyRemoteId,
  });

  @override
  List<Object?> get props => [name, code, agencyId, agencyRemoteId];
}

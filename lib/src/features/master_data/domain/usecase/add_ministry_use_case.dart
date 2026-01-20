import 'package:contrack/src/core/database/database.dart';
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
    return _repository.addMinistry(params.ministry);
  }
}

class AddMinistryParams extends Equatable {
  final Ministry ministry;

  const AddMinistryParams(this.ministry);

  @override
  List<Object?> get props => [ministry];
}

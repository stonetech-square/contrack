import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/user_management/domain/repository/user_management_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateUserUseCase implements UseCase<void, UpdateUserParams> {
  final UserManagementRepository _repository;

  UpdateUserUseCase(this._repository);

  @override
  Future<void> call(UpdateUserParams params) async {
    await _repository.updateUser(params.user);
  }
}

class UpdateUserParams extends Equatable {
  final User user;
  const UpdateUserParams({required this.user});
  @override
  List<Object?> get props => [user];
}

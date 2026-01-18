import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/user_management/domain/repository/user_management_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateUserUseCase implements UseCase<void, CreateUserParams> {
  final UserManagementRepository _repository;

  CreateUserUseCase(this._repository);

  @override
  Future<void> call(CreateUserParams params) async {
    await _repository.createUser(params.user);
  }
}

class CreateUserParams extends Equatable {
  final User user;
  const CreateUserParams({required this.user});
  @override
  List<Object?> get props => [user];
}

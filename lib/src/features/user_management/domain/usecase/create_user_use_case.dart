import 'package:contrack/src/core/common/enums/user_role.dart';
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
    await _repository.createUser(
      fullName: params.fullName,
      email: params.email,
      username: params.username,
      role: params.role,
    );
  }
}

class CreateUserParams extends Equatable {
  final String fullName;
  final String email;
  final String username;
  final UserRole role;
  const CreateUserParams({
    required this.fullName,
    required this.email,
    required this.username,
    required this.role,
  });
  @override
  List<Object?> get props => [fullName, email, username, role];
}

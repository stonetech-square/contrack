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
    await _repository.updateUser(
      userId: params.userId,
      fullName: params.fullName,
      email: params.email,
      username: params.username,
    );
  }
}

class UpdateUserParams extends Equatable {
  final String userId;
  final String? fullName;
  final String? email;
  final String? username;
  const UpdateUserParams({
    required this.userId,
    this.fullName,
    this.email,
    this.username,
  });
  @override
  List<Object?> get props => [userId, fullName, email, username];
}

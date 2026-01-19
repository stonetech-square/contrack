import 'package:contrack/src/core/common/enums/user_role.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/user_management/domain/repository/user_management_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ChangeUserRoleUseCase implements UseCase<void, ChangeUserRoleParams> {
  final UserManagementRepository _repository;

  ChangeUserRoleUseCase(this._repository);

  @override
  Future<void> call(ChangeUserRoleParams params) async {
    await _repository.changeUserRole(params.userId, params.role);
  }
}

class ChangeUserRoleParams extends Equatable {
  final String userId;
  final UserRole role;
  const ChangeUserRoleParams(this.userId, this.role);
  @override
  List<Object?> get props => [userId, role];
}

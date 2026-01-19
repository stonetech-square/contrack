import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/user_management/domain/repository/user_management_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ToggleUserStatusUseCase implements UseCase<void, ToggleUserStatusParams> {
  final UserManagementRepository _repository;

  ToggleUserStatusUseCase(this._repository);

  @override
  Future<void> call(ToggleUserStatusParams params) async {
    await _repository.toggleUserStatus(params.userId);
  }
}

class ToggleUserStatusParams extends Equatable {
  final String userId;
  const ToggleUserStatusParams(this.userId);
  @override
  List<Object?> get props => [userId];
}

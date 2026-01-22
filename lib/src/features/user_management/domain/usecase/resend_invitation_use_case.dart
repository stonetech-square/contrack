import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/user_management/domain/repository/user_management_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResendInvitationUseCase implements UseCase<void, ResendInvitationParams> {
  final UserManagementRepository _repository;

  ResendInvitationUseCase(this._repository);

  @override
  Future<void> call(ResendInvitationParams params) async {
    await _repository.resendInvitation(params.userId);
  }
}

class ResendInvitationParams extends Equatable {
  final String userId;
  const ResendInvitationParams(this.userId);
  @override
  List<Object?> get props => [userId];
}

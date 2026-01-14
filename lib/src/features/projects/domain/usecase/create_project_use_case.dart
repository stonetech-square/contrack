import 'package:contrack/src/core/common/enums/project_status.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/projects/domain/repository/projects_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateProjectUseCase implements UseCase<void, CreateProjectParams> {
  final ProjectsRepository _repository;

  CreateProjectUseCase(this._repository);

  @override
  Future<void> call(CreateProjectParams params) async {
    await _repository.createProject(
      code: params.code,
      status: params.status,
      agencyId: params.agencyId,
      ministryId: params.ministryId,
      stateId: params.stateId,
      zoneId: params.zoneId,
      constituency: params.constituency,
      title: params.title,
      amount: params.amount,
      sponsor: params.sponsor,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  }
}

class CreateProjectParams extends Equatable {
  final String code;
  final ProjectStatus status;
  final int agencyId;
  final int ministryId;
  final int stateId;
  final int zoneId;
  final String constituency;
  final String title;
  final double amount;
  final String? sponsor;
  final DateTime startDate;
  final DateTime endDate;

  const CreateProjectParams({
    required this.code,
    required this.status,
    required this.agencyId,
    required this.ministryId,
    required this.stateId,
    required this.zoneId,
    required this.constituency,
    required this.title,
    required this.amount,
    this.sponsor,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [
    code,
    status,
    agencyId,
    ministryId,
    stateId,
    zoneId,
    constituency,
    title,
    amount,
    sponsor,
    startDate,
    endDate,
  ];
}

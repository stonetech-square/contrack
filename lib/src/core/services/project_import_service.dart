import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProjectImportService {
  Future<List<ProjectImportDto>> importProjectsDto(File file);
}

class ProjectImportDto extends Equatable {
  final String code;
  final String title;
  final String projectStatus;
  final String? inHouseStatus;
  final double amount;
  final String agency;
  final String ministry;
  final String state;
  final String zone;
  final String constituency;
  final String? sponsor;
  final String? startDate;
  final String? endDate;

  const ProjectImportDto({
    required this.code,
    required this.title,
    required this.projectStatus,

    required this.amount,
    required this.agency,
    required this.ministry,
    required this.state,
    required this.zone,
    required this.constituency,
    this.sponsor,
    this.startDate,
    this.endDate,
    this.inHouseStatus,
  });

  @override
  List<Object?> get props => [
    code,
    title,
    projectStatus,
    inHouseStatus,
    amount,
    agency,
    ministry,
    state,
    zone,
    constituency,
    sponsor,
    startDate,
    endDate,
  ];
}

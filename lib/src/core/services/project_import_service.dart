import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class ProjectImportService {
  Future<List<ProjectImportDto>> importProjectsDto(File file);
}

class ProjectImportDto extends Equatable {
  final String code;
  final String title;
  final String status;
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
    required this.status,
    required this.amount,
    required this.agency,
    required this.ministry,
    required this.state,
    required this.zone,
    required this.constituency,
    this.sponsor,
    this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [
    code,
    title,
    status,
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

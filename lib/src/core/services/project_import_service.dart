import 'dart:io';

import 'package:equatable/equatable.dart';

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
  ];
}

abstract class ProjectImportService {
  Future<List<ProjectImportDto>> importProjectsDto(File file);
}

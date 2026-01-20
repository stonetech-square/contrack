import 'package:equatable/equatable.dart';

class MinistryInput extends Equatable {
  final String name;
  final String code;
  final int agencyId;
  final String? agencyRemoteId;

  const MinistryInput({
    required this.name,
    required this.code,
    required this.agencyId,
    this.agencyRemoteId,
  });

  @override
  List<Object?> get props => [name, code, agencyId, agencyRemoteId];
}

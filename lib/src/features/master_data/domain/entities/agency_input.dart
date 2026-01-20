import 'package:equatable/equatable.dart';

class AgencyInput extends Equatable {
  final String name;
  final String code;
  final int ministryId;
  final String? ministryRemoteId;

  const AgencyInput({
    required this.name,
    required this.code,
    required this.ministryId,
    this.ministryRemoteId,
  });

  @override
  List<Object?> get props => [name, code, ministryId, ministryRemoteId];
}

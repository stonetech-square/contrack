import 'package:equatable/equatable.dart';

class ImplementingAgency extends Equatable {
  final int id;
  final String name;
  final int ministryId;

  const ImplementingAgency({
    required this.id,
    required this.name,
    required this.ministryId,
  });

  @override
  List<Object> get props => [id, name, ministryId];
}

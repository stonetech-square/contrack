import 'package:equatable/equatable.dart';

class SupervisingMinistry extends Equatable {
  final int id;
  final String name;
  final int agencyId;

  const SupervisingMinistry({
    required this.id,
    required this.name,
    required this.agencyId,
  });

  @override
  List<Object> get props => [id, name, agencyId];
}

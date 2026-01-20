import 'package:equatable/equatable.dart';

class SupervisingMinistry extends Equatable {
  final int id;
  final String name;

  const SupervisingMinistry({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}

import 'package:equatable/equatable.dart';

class GeopoliticalZone extends Equatable {
  final int id;
  final String name;

  const GeopoliticalZone({required this.id, required this.name});

  @override
  List<Object> get props => [id, name];
}

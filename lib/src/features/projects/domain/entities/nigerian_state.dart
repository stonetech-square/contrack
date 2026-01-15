import 'package:equatable/equatable.dart';

class NigerianState extends Equatable {
  final int id;
  final String name;
  final int zoneId;

  const NigerianState({
    required this.id,
    required this.name,
    required this.zoneId,
  });

  @override
  List<Object> get props => [id, name, zoneId];
}

import 'package:equatable/equatable.dart';

class MinistryInput extends Equatable {
  final String name;
  final String code;

  const MinistryInput({
    required this.name,
    required this.code,
  });

  @override
  List<Object?> get props => [name, code];
}

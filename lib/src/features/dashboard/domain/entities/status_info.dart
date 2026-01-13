import 'package:equatable/equatable.dart';

class StatusInfo extends Equatable {
  final int count;
  final double percentage;

  const StatusInfo({
    required this.count,
    required this.percentage,
  });

  @override
  List<Object?> get props => [count, percentage];

  @override
  String toString() => 'StatusInfo(count: $count, percentage: ${percentage.toStringAsFixed(1)}%)';
}

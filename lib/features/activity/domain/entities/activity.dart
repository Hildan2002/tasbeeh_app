import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final int? id;
  final String title;
  final int currentValue;
  final int? reminder;
  final int? targetValue;
  final String? note;

  const Activity({
    this.id,
    required this.title,
    this.currentValue = 0,
    this.reminder,
    this.targetValue,
    this.note,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    currentValue,
    reminder,
    targetValue,
    note,
  ];
}

import 'package:equatable/equatable.dart';

class ActivitySummary extends Equatable {
  final int id;
  final String title;

  const ActivitySummary({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}

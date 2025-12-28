part of 'activity_bloc.dart';

sealed class ActivityEvent extends Equatable {
  const ActivityEvent();

  @override
  List<Object> get props => [];
}

final class ActivityLoadEvent extends ActivityEvent {}

final class ActivityAddEvent extends ActivityEvent {
  final Activity activity;

  const ActivityAddEvent({required this.activity});
}

final class ActivityUpdateEvent extends ActivityEvent {
  final Activity activity;

  const ActivityUpdateEvent({required this.activity});
}

final class ActivityDeleteEvent extends ActivityEvent {
  final int id;

  const ActivityDeleteEvent({required this.id});
}

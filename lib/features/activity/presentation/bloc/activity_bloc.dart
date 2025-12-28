import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasbeeh_app/core/usecase/use_case.dart';
import 'package:tasbeeh_app/features/activity/domain/entities/activity.dart';
import 'package:tasbeeh_app/features/activity/domain/usecases/add_activity.dart';
import 'package:tasbeeh_app/features/activity/domain/usecases/delete_activity.dart';
import 'package:tasbeeh_app/features/activity/domain/usecases/get_all_activities.dart';
import 'package:tasbeeh_app/features/activity/domain/usecases/update_activity.dart';

part 'activity_event.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final GetAllActivities getAllActivities;
  final AddActivity addActivity;
  final UpdateActivity updateActivity;
  final DeleteActivity deleteActivity;

  ActivityBloc({
    required this.getAllActivities,
    required this.addActivity,
    required this.updateActivity,
    required this.deleteActivity,
  }) : super(ActivityInitial()) {
    on<ActivityLoadEvent>(_onLoadActivities);
    on<ActivityAddEvent>(_onAddActivity);
    on<ActivityUpdateEvent>(_onUpdateActivity);
    on<ActivityDeleteEvent>(_onDeleteActivity);
  }

  Future<void> _onLoadActivities(
    ActivityLoadEvent event,
    Emitter<ActivityState> emit,
  ) async {
    emit(ActivityLoading());
    final result = await getAllActivities(NoParams());
    result.fold(
      (failure) => emit(ActivityError(message: failure.message)),
      (activities) => emit(ActivityLoaded(activities: activities)),
    );
  }

  Future<void> _onAddActivity(
    ActivityAddEvent event,
    Emitter<ActivityState> emit,
  ) async {
    emit(ActivityLoading());
    final result = await addActivity(event.activity);

    await result.fold(
      (failure) async => emit(ActivityError(message: failure.message)),
      (_) async => add(ActivityLoadEvent()),
    );
  }

  Future<void> _onUpdateActivity(
    ActivityUpdateEvent event,
    Emitter<ActivityState> emit,
  ) async {
    emit(ActivityLoading());
    final result = await updateActivity(event.activity);

    await result.fold(
      (failure) async => emit(ActivityError(message: failure.message)),
      (_) async => add(ActivityLoadEvent()),
    );
  }

  Future<void> _onDeleteActivity(
    ActivityDeleteEvent event,
    Emitter<ActivityState> emit,
  ) async {
    emit(ActivityLoading());
    final result = await deleteActivity(event.id);

    await result.fold(
      (failure) async => emit(ActivityError(message: failure.message)),
      (_) async => add(ActivityLoadEvent()),
    );
  }
}

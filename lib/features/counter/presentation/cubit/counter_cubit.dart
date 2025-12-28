import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasbeeh_app/features/counter/domain/usecases/increment_activity.dart';
import 'package:tasbeeh_app/features/counter/domain/usecases/reset_activity.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final IncrementActivity incrementActivity;
  final ResetActivity resetActivity;

  CounterCubit({
    required this.incrementActivity,
    required this.resetActivity,
  }) : super(CounterInitial());

  Future<void> increment(int id) async {
    // Just perform action and emit success/error.
    // Optimistic UI updates or full reloads are handled by ActivityBloc listing.
    
    final result = await incrementActivity(id);

    result.fold(
      (failure) => emit(CounterError(message: failure.message)),
      (_) => emit(CounterSuccess()),
    );
  }

  Future<void> reset(int id) async {
    emit(CounterLoading());
    final result = await resetActivity(id);

    result.fold(
      (failure) => emit(CounterError(message: failure.message)),
      (_) => emit(CounterSuccess()),
    );
  }
}
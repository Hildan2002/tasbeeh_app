part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterInitial extends CounterState {}

final class CounterLoading extends CounterState {}

final class CounterSuccess extends CounterState {}

final class CounterError extends CounterState {
  final String message;

  const CounterError({required this.message});

  @override
  List<Object> get props => [message];
}

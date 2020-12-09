abstract class CounterStates {}

class CounterStateInitial extends CounterStates {}

class CounterStateLoading extends CounterStates {}

class CounterStateSuccess extends CounterStates {}

class CounterStateError extends CounterStates
{
  final error;

  CounterStateError(this.error);
}
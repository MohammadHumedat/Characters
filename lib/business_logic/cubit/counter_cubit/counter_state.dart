part of 'counter_cubit.dart';

//Text counter هي البيانات الي بتتغير في الصفحةوالي هي حاليا
// This class contains every states that  you want to applying it in the cubit,
// and we make this class to just extends a class that contains what you looking for
final class CounterState {}

int counter = 0;

final class CounterInitial extends CounterState {}

final class IncrementCounter extends CounterState {
  final int counter;
  IncrementCounter({required this.counter});
}

final class DecrementCounter extends CounterState {
  final int counter;

  DecrementCounter({required this.counter});
}

final class ErrorCounter extends CounterState {
  final String message;
  ErrorCounter({required this.message});
}

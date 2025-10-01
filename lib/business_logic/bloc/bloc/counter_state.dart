part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {
  final int counter;
  const CounterState(this.counter);

  @override
  List<Object?> get props => [counter];  
}

final class InitialState extends CounterState{
  const InitialState(super.counter);
}
final class IncrementState extends CounterState {
  const IncrementState(super.counter);
}
final class IncrementBy5State extends CounterState {
  const IncrementBy5State(super.counter);
}

final class DecrementState extends CounterState {
  const DecrementState(super.counter);
}
 final class ErrorMassage extends CounterState{
   final String massage;
   const ErrorMassage(super.counter, this.massage);
}

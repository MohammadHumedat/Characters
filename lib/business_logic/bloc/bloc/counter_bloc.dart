import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const InitialState(0)) {
    on<IncrementEvent>((event, emit) {
      emit(IncrementState(state.counter + 1));
    });

    on<IncrementBy5Event>((event, emit) {
      emit(IncrementBy5State(state.counter + 5));
    });

    on<DecrementEvent>((event, emit) {
      emit(DecrementState(state.counter - 1));
    });
  }
}

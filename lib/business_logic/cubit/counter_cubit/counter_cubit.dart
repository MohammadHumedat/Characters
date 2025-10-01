
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int counter = 0;

  void incrementCounter() {
    counter++;
    emit(IncrementCounter(counter: counter));
  }

  void decrementCounter() {
    if (counter > 0) {
      counter--;
      emit(DecrementCounter(counter: counter));
    } else {
      emit(ErrorCounter(message: 'value is under zero this is not accepted'));
    }
  }

  void CounterError() {
    String message = "The counter is not working!!";
    emit(ErrorCounter(message: message));
  }

  
}

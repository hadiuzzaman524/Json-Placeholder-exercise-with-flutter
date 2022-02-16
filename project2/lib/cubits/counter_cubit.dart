import 'package:bloc/bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  int count = 0;

  CounterCubit() : super(CounterState(0));

  void increment() => emit(CounterState(state.count + 1));
}

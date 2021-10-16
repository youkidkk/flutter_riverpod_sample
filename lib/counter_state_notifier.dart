import 'package:flutter_riverpod_sample/counter_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CounterStateNotifier extends StateNotifier<CounterState> {
  CounterStateNotifier() : super(CounterState());

  increment() {
    state = state.copyWith(value: state.value + state.step);
  }

  decrement() {
    int newValue = state.value - state.step;
    if (newValue >= 0) {
      state = state.copyWith(value: newValue);
    }
  }

  incrementStep() {
    state = state.copyWith(step: state.step + 1);
  }

  decrementStep() {
    int newStep = state.step - 1;
    if (newStep > 0) {
      state = state.copyWith(step: newStep);
    }
  }
}

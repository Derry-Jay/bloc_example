import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/counter_event.dart';
import '../events/decrement_counter.dart';
import '../events/increment_counter.dart';
import '../utils/keys.dart';
import '../utils/values.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  late BuildContext _buildContext;
  CounterBloc(BuildContext context) : super(0) {
    _buildContext = context;
    on<IncrementCounter>((event, emit) => emit(state + 1));
    on<DecrementCounter>((event, emit) => emit(state - 1));
  }

  BuildContext get bc => (navKey.currentState?.context ??
      (wb?.buildOwner?.focusManager.rootScope.context ?? _buildContext));

  void increment() {
    add(IncrementCounter());
  }

  void decrement() {
    add(DecrementCounter());
  }
}

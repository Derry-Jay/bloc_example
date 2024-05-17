import 'counter_event.dart';

class IncrementCounter extends CounterEvent {
  static final IncrementCounter _singleton = IncrementCounter._internal();

  factory IncrementCounter() {
    return _singleton;
  }

  IncrementCounter._internal();
}

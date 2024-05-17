import 'counter_event.dart';

class DecrementCounter extends CounterEvent {
  static final DecrementCounter _singleton = DecrementCounter._internal();

  factory DecrementCounter() {
    return _singleton;
  }

  DecrementCounter._internal();
}

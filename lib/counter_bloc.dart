import 'dart:async';

enum CounterAction { Increment, Decrement, Reset }

class CounterBloc {
  int counter = 0;
  int x=0;
  final _stateStreamController = new StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink; // for input
  Stream<int> get counterStream => _stateStreamController.stream; // for output

  final _stateEventController = new StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink =>
      _stateEventController.sink; // for input
  Stream<CounterAction> get eventStream =>
      _stateEventController.stream; // for output

  // constructor
  CounterBloc() {
    eventStream.listen((event) {
      if (event == CounterAction.Increment) {
        counter++;
      } else if (event == CounterAction.Decrement) {
        counter--;
      } else if (event == CounterAction.Reset) {
        counter = 0;
      }
      counterSink.add(counter);
    });
  }
}

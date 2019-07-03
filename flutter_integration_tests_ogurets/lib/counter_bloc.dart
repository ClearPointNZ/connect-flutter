import 'dart:async';

import 'package:rxdart/rxdart.dart' as rxdart;


class CounterBloc {
  int _counter = 0;

  int _counter1 = 1;


  final _applicationStream = rxdart.BehaviorSubject<int>();
  Stream<int> get application => _applicationStream.stream;


  //constructor
  CounterBloc() {
    _applicationStream.add(_counter1);
    _applicationStream.add(_counter);
  }


  void dispose() {
    _applicationStream.close();
  }


  void counterInc() {
    _applicationStream.add(++_counter);
  }

  void counterDec() {
    _applicationStream.add(--_counter);
  }

}

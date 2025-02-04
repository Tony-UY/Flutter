import 'package:flutter/foundation.dart';

import '../models/CounterModel.dart';

class CounterViewModel extends ChangeNotifier {

  CounterModel _counter = CounterModel();

  void increment() {
    _counter.incrementCounter();
    notifyListeners();
  }

  void decrement() {
    _counter.decrementCounter();
    notifyListeners();
  }

  int get counter => _counter.getCounter();
}
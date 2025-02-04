class CounterModel {
  int _counter = 0;

  void incrementCounter() {
    _counter++;
  }

  void decrementCounter() {
    _counter--;
  }

  int getCounter() {
    return _counter;
  }
}
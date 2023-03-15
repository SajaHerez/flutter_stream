import 'dart:async';

class MyStream {
  final StreamController<int> _streamController = StreamController();

  void addStreamData() async {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      _streamController.sink.add(i);
    }
  }

  Stream<int> getSteamData() {
    return _streamController.stream;
  }

  Stream<int> numberStream() async* {
    for (var i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  void cancal() {
    _streamController.close();
  }
}

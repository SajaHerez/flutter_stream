import 'dart:async';

class MyStream {
  final StreamController _streamController = StreamController();





  Stream<int> numberStream() async* {
    for (var i = 0; i <= 10; i++) {
      Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }


  void cancal() {
    _streamController.close();
  }
}

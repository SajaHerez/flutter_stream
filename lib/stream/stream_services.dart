import 'dart:async';

class MyStream {
  final StreamController<int> streamController = StreamController();

   Future<Stream<int>> getSteamData() async {
    for (var i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      streamController.sink.add(i);
    }
    return streamController.stream;
  }

  Stream<int> numberStream() async* {
    for (var i = 0; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  void cancal() {
    streamController.close();
  }
}

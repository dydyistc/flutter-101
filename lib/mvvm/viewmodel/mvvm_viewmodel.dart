import 'dart:async';
import 'dart:math';

class MVVMViewModel {
  StreamController<String> streamController = StreamController<String>.broadcast();
  Stream<String> newStream;


  MVVMViewModel() {
    newStream = streamController.stream.map((value) => 'transform: $value');
  }

  void refresh() {
    streamController.sink.add(Random().nextInt(100).toString());
  }

  void dispose() {
    streamController.close();
  }
}
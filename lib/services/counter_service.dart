import 'package:get/get.dart';

class CounterService extends GetxController {
  static CounterService instance = Get.put(CounterService());

  final _counter = 0.obs;

  int getCounter() => _counter.value;

  void increment() => _counter.value++;

  void decrement() =>
      _counter.value == 0 ? _counter.value = 0 : _counter.value--;

  void reset() => _counter.value = 0;
}

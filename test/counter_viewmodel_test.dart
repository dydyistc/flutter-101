
import 'package:flutter101/provider/Counter/counter_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('increment', () {
    final viewModel = CounterViewModel();
    viewModel.addListener(() {
      expect(viewModel.count, 1);
    });
    viewModel.increment();
  });
}
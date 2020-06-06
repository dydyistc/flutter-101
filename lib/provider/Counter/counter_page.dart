import 'package:flutter/material.dart';
import 'package:flutter101/provider/Counter/counter_viewmodel.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final CounterViewModel _viewModel = CounterViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        appBar: AppBar(title: Text('Counter'),),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Consumer<CounterViewModel>(
                builder: (context, viewModel, child) {
                  print('rebuild: text');
                  return Text(
                    '${viewModel.count}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            print('rebuild: floating button');
            return FloatingActionButton(
              onPressed: () => _viewModel.increment(),
              child: const Icon(Icons.add),
            );
          }
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter101/mvvm/viewmodel/mvvm_viewmodel.dart';

class MVVMPage extends StatefulWidget {
  @override
  _MVVMPageState createState() => _MVVMPageState();
}

class _MVVMPageState extends State<MVVMPage> {
  final MVVMViewModel viewModel = MVVMViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MVVM Page')),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          StreamBuilder(
              stream: viewModel.streamController.stream,
              builder: (ctx, snap) {
                var value = snap.data ?? '';
                return Text(value);
              }
          ),
            StreamBuilder(
                stream: viewModel.newStream,
                builder: (ctx, snap) {
                  var value = snap.data ?? '';
                  return Text(value);
                }
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.refresh(),
        child: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.dispose();
  }


}
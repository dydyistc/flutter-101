import 'package:flutter/material.dart';
import 'package:flutter101/route_config.dart';

enum _ParseMethod {
  manual, automatic
}

class JsonParsePage extends StatefulWidget {
  @override
  _JsonParsePageState createState() => _JsonParsePageState();
}

class _JsonParsePageState extends State<JsonParsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Json Parse'),),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        itemCount: _ParseMethod.values.length,
        itemBuilder: _itemBuilder,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    switch (_ParseMethod.values[index]) {
      case _ParseMethod.manual:
        return _buttonBuilder('Manual Parse', () => Navigator.of(context).pushNamed(RouteNames.jsonManualParsePage));
      case _ParseMethod.automatic:
        return _buttonBuilder('Automatic Parse', () => Navigator.of(context).pushNamed(RouteNames.jsonAutomaticParsePage));
    }
  }

  Widget _buttonBuilder(String text, Function onPressed) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(text, style: Theme.of(context).textTheme.button,),
    );
  }
}

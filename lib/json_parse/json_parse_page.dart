import 'package:flutter/material.dart';
import 'package:flutter101/route_config.dart';

class JsonParsePage extends StatefulWidget {
  @override
  _JsonParsePageState createState() => _JsonParsePageState();
}

class _JsonParsePageState extends State<JsonParsePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Json Parse'),),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        children: <Widget>[
          _button('Manual Parse', RouteNames.jsonManualParsePage),
          _button('Automatic Parse', RouteNames.jsonAutomaticParsePage),
        ],
      ),
    );
  }

  Widget _button(String text, String routeName) {
    return RaisedButton(
      onPressed: () => Navigator.of(context).pushNamed(routeName),
      child: Text(text, style: Theme.of(context).textTheme.button,),
    );
  }
}

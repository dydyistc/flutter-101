
import 'package:flutter/material.dart';
import 'package:flutter101/route_config.dart';

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Provider Demo'),),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        children: <Widget>[
          _button('Counter', RouteNames.counterPage),
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

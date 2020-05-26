import 'package:flutter/material.dart';
import 'package:flutter101/route_config.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animation'),),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        children: <Widget>[
          _button('Progress', () => Navigator.of(context).pushNamed(RouteNames.progressAnimationPage)),
        ],
      )
    );
  }

  Widget _button(String text, VoidCallback onPressed) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(text, style: Theme.of(context).textTheme.button,),
    );
  }
}

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
          _button('Scale Animation', () => Navigator.of(context).pushNamed(RouteNames.scaleAnimationPage)),
          _button('Scale Animated Widget', () => Navigator.of(context).pushNamed(RouteNames.scaleAnimatedWidgetPage)),
          _button('Scale Animated Builder', () => Navigator.of(context).pushNamed(RouteNames.scaleAnimatedBuilderPage)),
          _button('Scale Animated Builder Refactor', () => Navigator.of(context).pushNamed(RouteNames.scaleAnimatedBuilderRefactorPage)),
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

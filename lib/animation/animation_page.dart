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
          _button('Progress', RouteNames.progressAnimationPage),
          _button('Scale Animation', RouteNames.scaleAnimationPage),
          _button('Scale Animated Widget', RouteNames.scaleAnimatedWidgetPage),
          _button('Scale Animated Builder', RouteNames.scaleAnimatedBuilderPage),
          _button('Scale Animated Builder Refactor', RouteNames.scaleAnimatedBuilderRefactorPage),
          Hero(
            tag: 'hero',
            child: _button('Hero Animation', RouteNames.heroAnimationPage),
          ),
        ],
      )
    );
  }

  Widget _button(String text, String routeName) {
    return RaisedButton(
      onPressed: () => Navigator.of(context).pushNamed(routeName),
      child: Text(text, style: Theme.of(context).textTheme.button,),
    );
  }
}

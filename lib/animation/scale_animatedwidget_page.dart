import 'package:flutter/material.dart';

class ScaleAnimatedWidgetPage extends StatefulWidget {
  @override
  _ScaleAnimatedWidgetPageState createState() => _ScaleAnimatedWidgetPageState();
}

class _ScaleAnimatedWidgetPageState extends State<ScaleAnimatedWidgetPage> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 50.0, end: 200.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scale Animated Widget'),),
      body: Center(
        child: _ScaleAnimatedWidget(animation: animation,),
      ),
    );
  }
}

class _ScaleAnimatedWidget extends AnimatedWidget {

  _ScaleAnimatedWidget({Key key, Animation<double> animation})
    : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Container(
      width: animation.value,
      height: animation.value,
      color: Colors.blue,
    );
  }
}
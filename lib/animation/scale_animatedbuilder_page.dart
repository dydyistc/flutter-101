
import 'package:flutter/material.dart';

class ScaleAnimatedBuilderPage extends StatefulWidget {
  @override
  _ScaleAnimatedBuilderPageState createState() => _ScaleAnimatedBuilderPageState();
}

class _ScaleAnimatedBuilderPageState extends State<ScaleAnimatedBuilderPage> with SingleTickerProviderStateMixin {

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
      appBar: AppBar(title: Text('Scale Animated Builder'),),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          child: Container(color: Colors.blue,),
          builder: (context, child) {
            return Container(
              width: animation.value,
              height: animation.value,
              child: child,
            );
          },
        ),
      ),
    );
  }
}

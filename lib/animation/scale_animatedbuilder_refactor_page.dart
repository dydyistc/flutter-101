
import 'package:flutter/material.dart';

class ScaleAnimatedBuilderRefactorPage extends StatefulWidget {
  @override
  _ScaleAnimatedBuilderRefactorPageState createState() => _ScaleAnimatedBuilderRefactorPageState();
}

class _ScaleAnimatedBuilderRefactorPageState extends State<ScaleAnimatedBuilderRefactorPage> with SingleTickerProviderStateMixin {

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
      appBar: AppBar(title: Text('Scale Animated Builder Refactor'),),
      body: Center(
        child: _ScaleAnimation(
          animation: animation,
          child: Container(color: Colors.blue,),
        ),
      ),
    );
  }
}

class _ScaleAnimation extends StatelessWidget {
  _ScaleAnimation({this.animation, this.child});

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, child) {
        return Container(
          width: animation.value,
          height: animation.value,
          child: child,
        );
      },
    );
  }
}
import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  @override
  _ScaleAnimationPageState createState() => _ScaleAnimationPageState();
}

// 如果有多个 AnimationController，则应该使用 TickerProviderStateMixin。
class _ScaleAnimationPageState extends State<ScaleAnimationPage> with SingleTickerProviderStateMixin {

  Animation<double> animation;
  AnimationController controller;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync: this,);
    animation = Tween(begin: 50.0, end: 200.0).animate(controller)
      ..addListener(() => setState(() => {}));
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
      appBar: AppBar(title: Text('Scale Animation'),),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: Colors.blue,
        ),
      ),
    );
  }
}

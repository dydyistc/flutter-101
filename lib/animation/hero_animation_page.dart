
import 'package:flutter/material.dart';

class HeroAnimationPage extends StatefulWidget {
  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation'),),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            Hero(
              tag: 'hero',
              child: SizedBox(
                width: 130,
                height: 48,
                child: RaisedButton(
                  onPressed: () => {},
                  child: Text('Hero Animation', style: Theme.of(context).textTheme.button,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

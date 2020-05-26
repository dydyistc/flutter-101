import 'package:flutter/material.dart';
import 'package:flutter101/global.dart';
import 'package:flutter101/route_config.dart';

void main() => Global.init().then((e) => runApp(App()));

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter101',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        buttonColor: Colors.blue,
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white)
        )
      ),
      routes: RouteConfig.routes,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter101'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(RouteNames.commonRoutePage),
              child: new Text('Normal Route', style: theme.textTheme.button),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(RouteNames.namedRoutePage),
              child: new Text('Named Route', style: theme.textTheme.button),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(RouteNames.mvvmPage),
              child: new Text('MVVM', style: theme.textTheme.button),
            ),
            RaisedButton(
              onPressed:  () => Navigator.of(context).pushNamed(RouteNames.jsonParsePage),
              child: Text('Json Parse', style: theme.textTheme.button,),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(RouteNames.httpPage),
              child: Text('Http', style: theme.textTheme.button),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed(RouteNames.animationPage),
              child: Text('Animation', style: theme.textTheme.button,),
            ),
          ],
        )
      )
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class CommonRoutePage extends StatefulWidget {

  @override
  _CommonRoutePageState createState() => _CommonRoutePageState();
}

class _CommonRoutePageState extends State<CommonRoutePage> {
  String _result = "";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Common Route Page')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => CommonRoutePage1()
              )),
              child: new Text('open next page', style: theme.textTheme.button),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => CommonRoutePage1()
              )),
              child: new Text('Close and open next page', style: theme.textTheme.button),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                settings: RouteSettings(
                  arguments: Random().nextInt(100).toString()
                ),
                builder: (ctx) => CommonRoutePage1()
              )),
              child: new Text('open next and send params', style: theme.textTheme.button),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => CommonRoutePage1()
              )).then((value) {
                setState(() {
                  _result = value?.toString() ?? '';
                });
              }),
              child: new Text('Open and receive from next page: $_result', style: theme.textTheme.button),
            ),
          ],
        )
      )
    );
  }
}

class CommonRoutePage1 extends StatelessWidget {
  final String value = Random().nextInt(100).toString();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var param = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Next Page')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        child: ListView(
          children: <Widget>[
            Text(param == null ? 'No param' : param),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: new Text('Back', style: theme.textTheme.button),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).pop(value),
              child: new Text('Back and send param: $value', style: theme.textTheme.button),
            ),
          ],
        )
      ),
    );
  }
}
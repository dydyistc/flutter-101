import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter101/route_config.dart';

class NamedRoutePage extends StatefulWidget {

  @override
  _NamedRoutePageState createState() => _NamedRoutePageState();
}

class _NamedRoutePageState extends State<NamedRoutePage> {
  String _result = "";

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(title: Text('Named Route Page')),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: ListView(
              children: <Widget>[
                RaisedButton(
                  onPressed: () => Navigator.of(context).pushNamed(RouteNames.namedRouteTestPage),
                  child: new Text('open next page', style: theme.textTheme.button),
                ),
                RaisedButton(
                  onPressed: () => Navigator.of(context).popAndPushNamed(RouteNames.namedRouteTestPage),
                  child: new Text('open next page and close current page', style: theme.textTheme.button),
                ),
                RaisedButton(
                  onPressed: () => Navigator.of(context).pushNamed(RouteNames.namedRouteTestPage, arguments: Random().nextInt(100).toString()),
                  child: new Text('open next and send params', style: theme.textTheme.button),
                ),
                RaisedButton(
                  onPressed: () => Navigator.of(context).pushNamed(RouteNames.namedRouteTestPage).then((value) {
                    setState(() {
                      _result = value?.toString() ?? '';
                    });
                  }),
                  child: new Text('open next page, receive from next page: $_result', style: theme.textTheme.button),
                ),
              ],
            )
        )
    );
  }
}

class NamedRouteTestPage extends StatelessWidget {
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
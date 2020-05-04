import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter101/json_parse/json_parse_service.dart';
import 'package:flutter101/json_parse/json_structure.dart';
import 'package:flutter101/json_parse/manual_parse/manual_parse_model.dart';

class ManualParsePage extends StatefulWidget {
  @override
  _ManualParsePageState createState() => _ManualParsePageState();
}

class _ManualParsePageState extends State<ManualParsePage> {

  JsonStructure _jsonStructure;

  List<String> _titles = [
    'List',
    'Map',
    'Map with List',
    'Map with List Model',
    'Map with Model'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manual Parse')),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          children: <Widget>[
            _resultBuilder(),
            SizedBox(height: 20,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: JsonStructure.values.length,
              itemBuilder: _itemBuilder,
            ),
          ],
        ),
      ),
    );
  }

  Widget _resultBuilder() {
    return Container(
        constraints: BoxConstraints.expand(height: 80),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: (_jsonStructure == null)
              ? Text('')
              : FutureBuilder(
            future: loadJsonString(_jsonStructure),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                var decodedJson = json.decode(snapshot.data);
                switch (_jsonStructure) {
                  case JsonStructure.basicList:
                    return Text(BasicList.fromJson(decodedJson).toString());
                  case JsonStructure.basicMap:
                    return Text(BasicMap.fromJson(decodedJson).toString());
                  case JsonStructure.basicMapWithList:
                    return Text(BasicMapWithList.fromJson(decodedJson).toString());
                  case JsonStructure.basicMapWithListModel:
                    return Text(BasicMapWithListModel.fromJson(decodedJson).toString());
                  case JsonStructure.basicMapWithModel:
                    return Text(BasicMapWithModel.fromJson(decodedJson).toString());
                }
              } if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Text('loading...');
              }
            },
          ),
        )
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return _buttonBuilder(_titles[index], () {
      setState(() {
        _jsonStructure = JsonStructure.values[index];
      });
    });
  }

  Widget _buttonBuilder(String text, Function onPressed) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(text, style: Theme.of(context).textTheme.button,),
    );
  }
}

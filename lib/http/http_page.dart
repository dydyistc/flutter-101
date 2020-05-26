
import 'package:flutter/material.dart';
import 'package:flutter101/http/http/http.dart';
import 'package:flutter101/http/http/http_error.dart';
import 'package:flutter101/http/search_books_model.dart';

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {

  bool _isLoading = false;
  SearchBooksModel _model;
  HttpError _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Http'),),
      body: Center(
        child: body(),
      ),
    );
  }

  Widget body() {
    if (_isLoading) {
      return CircularProgressIndicator();
    } else if (_model != null) {
      return Text(_model.toString());
    } else if (_error != null) {
      return Text(_error.toString());
    } else {
      return RaisedButton(
        onPressed: () {
          setState(() => _isLoading = true);
          searchBooks();
        },
        child: Text('点击搜索', style: Theme.of(context).textTheme.button,),
      );
    }
  }

  void searchBooks() {
    var params = {
      'apikey': '0df993c66c0c636e29ecbb5344252a4a', // 可以传错误的 apikey 来测试请求失败的情况。
      'q': '传奇',
      'start': 0,
      'count': 10,
    };
    Http.searchBooks(params)
      .then((model) => _model = model)
      .catchError((error) => _error = error)
      .whenComplete(() => setState(() => _isLoading = false));
  }
}

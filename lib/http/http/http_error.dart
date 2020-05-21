
import 'package:dio/dio.dart';

enum HttpErrorType {
  connectTimeout,
  cancel,
  dataParsing,
  unknown,
}

class HttpError implements Exception {
  HttpError(this.type, this.message);

  final HttpErrorType type;
  final String message;
}
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter101/http/http/http_interceptor.dart';

import 'http_error.dart';

typedef DataParsingCallback<T> = T Function(dynamic data);

class HttpManager {
  static Dio dio = Dio(BaseOptions(
    baseUrl: 'https://api.douban.com',
    connectTimeout: 10000, // 请求超时 10s
  ));

  static Future init() async {
    // 可以在App启动时从本地读取并设置用户token
    // dio.options.headers[HttpHeaders.authorizationHeader] = '';

    dio.interceptors.add(HttpInterceptor());
  }

  static Future<T> get<T>(
    String path, {
    Map<String, dynamic> params,
    CancelToken cancelToken,
    DataParsingCallback<T> dataParsing,
  }) async {
    return _request(path, "GET", queryParameters: params, dataParsing: dataParsing);
  }

  static Future<T> post<T>(
    String path, {
    data,
    CancelToken cancelToken,
    DataParsingCallback<T> dataParsing,
  }) async {
    return _request(path, "POST", data: data, dataParsing: dataParsing);
  }

  static Future<T> _request<T>(
    String path, String method, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    DataParsingCallback<T> dataParsing,
  }) {
    return dio.request(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: Options(method: method),
    )
      .then((response) {
        if (response.data != null && dataParsing != null) {
          try {
            return dataParsing(response.data);
          } catch (_) {
            throw HttpError(HttpErrorType.dataParsing, '数据解析出错啦，请稍后重试');
          }
        } else {
          return response.data;
        }
    });
  }
}

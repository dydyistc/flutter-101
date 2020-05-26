
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

HttpError castDioErrorToHttpError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.CONNECT_TIMEOUT:
      return HttpError(HttpErrorType.connectTimeout, '连接超时，请稍后重试');
    case DioErrorType.CANCEL:
      return HttpError(HttpErrorType.cancel, '已取消请求');
    case DioErrorType.RESPONSE:
    // When the server response, but with a incorrect status, such as 404, 503...
    // TODO: 根据业务规则 http status code、约定的错误数据结构，来转换 DioError 为 HttpError
    // If you want to resolve the request with some custom data，
    // you can return a [Response] object or return [dio.resolve].   (HttpManager.dio.resolve(...))
      return HttpError(HttpErrorType.unknown, '请求失败，请稍后重试');
    default:
      return HttpError(HttpErrorType.unknown, '请求失败，请稍后重试');
  }
}
import 'package:dio/dio.dart';

class Logging extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('Request [${options.method}] => URL: ${options.uri}');
    print('Headers: ${options.headers}');
    print('Data: ${options.data}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response [${response.statusCode}] => Data: ${response.data}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('Error [${err.response?.statusCode}] => Message: ${err.message}');
    print('Error data: ${err.response?.data}');
    super.onError(err, handler);
  }
}

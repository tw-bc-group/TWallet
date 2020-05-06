import 'package:dio/dio.dart';

class LogInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print(options.method);
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(response.statusCode);
    print(response.data);
    return super.onResponse(response);
  }
}
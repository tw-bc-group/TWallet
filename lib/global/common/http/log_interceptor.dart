import 'package:dio/dio.dart';

class LogInterceptor extends InterceptorsWrapper {

  static int requestNum = 0;

  @override
  Future onResponse(Response response) {
    print(response.statusCode);
    print(response.data);
    return super.onResponse(response);
  }
}
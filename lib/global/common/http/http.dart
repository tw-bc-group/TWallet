import 'package:dio/dio.dart';
import 'package:tw_wallet_ui/global/common/env.dart';
import 'package:tw_wallet_ui/global/common/http/loading_interceptor.dart';

class Http {
  static final Dio httpInstance = Dio(BaseOptions(
      baseUrl: API_GATEWAY_BASE_URL,
      connectTimeout: API_GATEWAY_CONNECT_TIMEOUT,
      responseType: ResponseType.json,
      validateStatus: (statusCode) {
        switch (statusCode) {
          case 404:
          case 405:
          case 502:
            return false;
          default:
            return true;
        }
      }));

  static Dio init() {
    httpInstance.interceptors.add(LoadingInterceptor());
    httpInstance.interceptors.add(LogInterceptor());
    return httpInstance;
  }
}

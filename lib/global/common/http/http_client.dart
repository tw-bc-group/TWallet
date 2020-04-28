import 'package:dio/dio.dart';
import 'package:tw_wallet_ui/global/common/env.dart';
import 'package:tw_wallet_ui/global/common/http/loading_interceptor.dart';

class HttpClient {
  final Dio _dio = Dio()
    ..options = BaseOptions(
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
        })
    ..interceptors.add(LoadingInterceptor())
    ..interceptors.add(LogInterceptor());

  Future<Response> get(String url, {bool loading: false}) async {
    return _dio.get(url, options: Options(extra: {'withoutLoading': !loading}));
  }

  Future<Response> post(String url, Map<String, dynamic> data,
      {bool loading: false}) async {
    return _dio.post(url,
        options: Options(extra: {'withoutLoading': !loading}), data: data);
  }
}

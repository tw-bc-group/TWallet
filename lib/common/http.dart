import 'package:dio/dio.dart';
import 'package:tw_wallet_ui/common/env.dart';

class Http {
  static final Dio httpInstance = Dio(BaseOptions(
      baseUrl: API_GATEWAY_BASE_URL,
      connectTimeout: API_GATEWAY_CONNECT_TIMEOUT,
      responseType: ResponseType.json));
}

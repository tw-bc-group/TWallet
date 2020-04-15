import 'package:dio/dio.dart';
import 'package:tw_wallet_ui/global/service/api_response.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future onResponse(Response response) {
    final data = ApiResponse.fromJson(response.data);
    // TODO: parse error
    return data.result;
  }
}

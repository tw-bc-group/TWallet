import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

//const CONNECT_TIMEOUT = 5000;

class ApiProvider {
  final Dio dio;

  ApiProvider({this.dio});
//  final Dio _client = Dio()
//    ..options.baseUrl = API_BASE_URL
//    ..options.connectTimeout = CONNECT_TIMEOUT;

  Future<Response> fetchPointV1({@required String address}) async {
    return dio.get('/v1/tw-points/' + address);
  }
}

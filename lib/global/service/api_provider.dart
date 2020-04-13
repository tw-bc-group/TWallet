import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class ApiProvider {
  final Dio dio;

  ApiProvider({this.dio});

  Future<Response> fetchPointV1({@required String address}) async {
    return dio.get('/v1/tw-points/' + address);
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/common/http.dart';

class HomeService {
  static Future<Response> fetchPointV1({@required String address}) async {
    return Http.httpInstance.get('/v1/tw-points/' + address);
  }
}

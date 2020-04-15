import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';

class ApiProvider {
  ApiProvider();

  final Dio _dio = getIt<Dio>();

  Future<Response> fetchPointV1({@required String address}) async {
    return _dio.get('/v1/tw-points/' + address);
  }

  Future<Response> addIdentityV1(
      {@required String name,
      @required String did,
      @required String address,
      @required String publicKey}) {
    return _dio.post('/v1/identities', data: {
      //'name': name,
      'did': did,
      'address': address,
      'publicKey': publicKey
    });
  }
}

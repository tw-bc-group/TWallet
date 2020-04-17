import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_response.dart';
import 'package:tw_wallet_ui/models/transaction.dart';

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

  Future<List<Transaction>> listTx() async {
    final resp = await _dio.get("/v1/transactions");
    final ApiResponse data = ApiResponse.fromJson(resp.data);
    return data.result;
  }

  Future<Transaction> fetchTxDetails({@required String txHash}) async {
    final resp = await _dio.get("/v1/transactions/" + txHash);
    final ApiResponse data = ApiResponse.fromJson(resp.data);
    return data.result;
  }
}

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/http/http_client.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

class ApiProvider {
  final HttpClient _httpClient = getIt<HttpClient>();

  Future<TwBalance> fetchPointV1({@required String address}) async {
    return _httpClient
        .get('/v1/tw-points/' + address, loading: false)
        .then((response) {
      return Future.value(
          ApiResponse.fromJson(response.data, [FullType(TwBalance)]).result);
    });
  }

  Future<Contract> fetchContractAbiV1({@required String contractName}) async {
    return _httpClient
        .get('/v1/contracts/$contractName', loading: false)
        .then((response) {
      return Future.value(
          ApiResponse.fromJson(response.data, [FullType(Contract)]).result);
    });
  }

  Future<Response> identityRegister(String name, String publicKey,
      String address, String did, String signedRawTx) {
    return _httpClient.post('/v1/identities', {
      'name': name,
      'publicKey': publicKey,
      'address': address,
      'did': did,
      'signedTransactionRawData': signedRawTx
    });
  }

  Future<Response> transferPoint(
      String fromAddress, String publicKey, String signedRawTx) {
    return _httpClient.post('/v1/tw-points/transfer', {
      'fromAddress': fromAddress,
      'fromPublicKey': publicKey,
      'signedTransactionRawData': signedRawTx
    });
  }

  Future<List<Transaction>> fetchTxList(String fromAddress) async {
    return _httpClient
        .get('/v1/transactions?from_addr=$fromAddress')
        .then((response) {
      return Future.value(ApiResponse.fromJson(response.data, [
        FullType(BuiltList, [FullType(Transaction)])
      ]).result.toList());
    });
  }

  Future<Transaction> fetchTxDetails({@required String txHash}) async {
    return _httpClient.get('/v1/transactions/' + txHash).then((response) {
      return Future.value(
          ApiResponse.fromJson(response.data, [FullType(Transaction)]).result);
    });
  }

  Future<HealthCertification> healthCertificate(
      String phone, String did) {
    return _httpClient.post('/v1/health-certifications', {
      'phone': phone,
      'did': did
    }).then((response) {
      // var a = "{@context: [String],exp: 0,iat: 0,id: string,iss: string,typ: [string],ver: string}";
      var a = {
        'code': 40000,
        'msg': 'aaa',
        'result': {
          '@context': ['String'],
          'id': 'did',
          'ver': '0.1',
          'iss': 'null',
          'iat': 1111,
          'exp': 1111,
          'typ': ['HealthyStatus'],
          // 'sub': {
          //   'id': 'did',
            // 'phone': 'aaa',
            // 'healthyStatus': {
            //   'typ': 'HealthyStatus',
            //   'val': 'unhealthy'
            // }
          // }
        }
      };
      print(response.data);
      return Future.value(
          // ApiResponse.fromJson(response.data, [FullType(HealthCertification)]).result);
          ApiResponse.fromJson(a, [FullType(HealthCertification)]).result);
      // var b = "{code: 0, msg: SUCCESS, result: [{hash: 0xdc70dc224450337e531918e05dfd2bcd30c79f7016f321c4317ac5d756ef754e, tx_type: Transfer, amount: 1000000000000000000, create_time: 2020-04-24 06:54:22, confirm_time: null, from_address: 0x0964f17b11f450696389599a4dece034750261ee, from_address_name: null, to_address: 0x0964f17b11f450696389599a4dece034750261ee, to_address_name: null}]}";
      // return Future.value(ApiResponse.fromJson(b, [
      //   FullType(BuiltList, [FullType(Transaction)])
      // ]).result.toList());
    });
  }
}

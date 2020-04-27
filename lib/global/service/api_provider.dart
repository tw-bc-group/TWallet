import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

class ApiProvider {
  ApiProvider();

  final Dio _dio = getIt<Dio>();

  Future<TwBalance> fetchPointV1({@required String address}) async {
    return _dio.get('/v1/tw-points/' + address).then((response) {
      return Future.value(
          ApiResponse.fromJson(response.data, [FullType(TwBalance)]).result);
    });
  }

  Future<Contract> fetchContractAbiV1({@required String contractName}) async {
    return _dio.get('/v1/contracts/$contractName').then((response) {
      return Future.value(
          ApiResponse.fromJson(response.data, [FullType(Contract)]).result);
    });
  }

  Future<Response> identityRegister(String name, String publicKey,
      String address, String did, String signedRawTx) {
    return _dio.post('/v1/identities', data: {
      'name': name,
      'publicKey': publicKey,
      'address': address,
      'did': did,
      'signedTransactionRawData': signedRawTx
    });
  }

  Future<Response> transferPoint(
      String fromAddress, String publicKey, String signedRawTx) {
    return _dio.post('/v1/tw-points/transfer', data: {
      'fromAddress': fromAddress,
      'fromPublicKey': publicKey,
      'signedTransactionRawData': signedRawTx
    });
  }

  Future<List<Transaction>> fetchTxList(String fromAddress) async {
    return _dio.get('/v1/transactions?from_addr=$fromAddress').then((response) {
      return Future.value(ApiResponse.fromJson(response.data, [
        FullType(BuiltList, [FullType(Transaction)])
      ]).result.toList());
    });
  }

  Future<Transaction> fetchTxDetails({@required String txHash}) async {
    return _dio.get('/v1/transactions/' + txHash).then((response) {
      return Future.value(
          ApiResponse.fromJson(response.data, [FullType(Transaction)]).result);
    });
  }
}

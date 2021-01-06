import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as g;
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/models/issuer_response.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

class ApiProvider {
  final HttpClient _httpClient = g.Get.find();

  Future<void> transferDcepV2(
      String from, String publicKey, String signedRawTx) {
    return _httpClient.post(
        '/v2/token/transfer',
        {
          'fromAddress': from,
          'fromPublicKey': publicKey,
          'signedTransactionRawData': signedRawTx,
        },
        throwError: true);
  }

  Future<Optional<Dcep>> redeemDcepV2(String address, DcepType type) {
    return _httpClient.post('/v2/token/mint', {
      'address': address,
      'moneyType': type.toString()
    }).then((res) => Future.value(res.map((response) =>
        ApiResponse.fromJson(response.data, const [FullType(Dcep)]).result
            as Dcep)));
  }

  Future<Optional<List<Dcep>>> fetchDcepV2(
    String address,
  ) {
    return _httpClient.get('/v2/token?address=$address', loading: false).then(
        (res) => Future.value(
            res.map((response) => ApiResponse.fromJson(response.data, const [
                  FullType(BuiltList, [FullType(Dcep)])
                ]).result.toList() as List<Dcep>)));
  }

  Future<Optional<TwBalance>> fetchPointV1(
      {@required String address, bool withLoading}) async {
    return _httpClient
        .get('/v1/token/$address', loading: withLoading ?? true)
        .then((res) {
      return Future.value(res.map((response) => ApiResponse.fromJson(
            response.data,
            const [FullType(TwBalance)],
          ).result as TwBalance));
    });
  }

  Future<Optional<Contract>> fetchContractAbiV1(
      {@required String contractName}) async {
    return _httpClient
        .get('/v1/contracts/$contractName', loading: false, throwError: true)
        .then((res) {
      return Future.value(res.map((response) =>
          ApiResponse.fromJson(response.data, const [FullType(Contract)]).result
              as Contract));
    });
  }

  Future<Optional<Response>> identityRegister(String name, String publicKey,
      String address, String did, String signedRawTx) {
    return _httpClient.post(
      '/v1/identities',
      {
        'name': name,
        'publicKey': publicKey,
        'address': address,
        'did': did,
        'signedTransactionRawData': signedRawTx
      },
    );
  }

  Future<Optional<Response>> transferPoint(
      String fromAddress, String publicKey, String signedRawTx) {
    return _httpClient.post('/v1/token/transfer', {
      'fromAddress': fromAddress,
      'fromPublicKey': publicKey,
      'signedTransactionRawData': signedRawTx
    });
  }

  Future<Optional<List<Transaction>>> fetchTxList(String fromAddress) async {
    return _httpClient
        .get('/v1/transactions?from_addr=$fromAddress', throwError: true)
        .then((res) {
      return Future.value(
          res.map((response) => ApiResponse.fromJson(response.data, const [
                FullType(BuiltList, [FullType(Transaction)])
              ]).result.toList() as List<Transaction>));
    });
  }

  Future<Optional<Transaction>> fetchTxDetails(
      {@required String txHash}) async {
    return _httpClient.get('/v1/transactions/$txHash').then((res) {
      return Future.value(res.map((response) =>
          ApiResponse.fromJson(response.data, [const FullType(Transaction)])
              .result as Transaction));
    });
  }

  Future<Optional<HealthCertificationToken>> healthCertificate(String did,
      String phone, double temperature, String contact, String symptoms) {
    return _httpClient.post('/v1/health-certifications', {
      'did': did,
      'phone': phone,
      'temperature': temperature,
      'contact': contact,
      "symptoms": symptoms
    }).then((res) => Future.value(res.map((response) => ApiResponse.fromJson(
            response.data, [const FullType(HealthCertificationToken)]).result
        as HealthCertificationToken)));
  }

  Future<Optional<HealthCertificationToken>> fetchHealthCertificate(
      String did) {
    return _httpClient.get('/v1/health-certifications/$did').then((res) =>
        Future.value(res.map((response) => ApiResponse.fromJson(
                response.data, [const FullType(HealthCertificationToken)])
            .result as HealthCertificationToken)));
  }

  Future<Optional<Response>> verifyHealthCertificationToken(String token) {
    return _httpClient
        .post('/v1/health-certifications/verify', {'token': token});
  }

  Future<Optional<Response>> issuePoints(String address) {
    return _httpClient
        .post('/v1/token/reward', {'address': address, 'amount': 10});
  }

  Future<Optional<List<IssuerResponse>>> fetchIssuers() {
    return _httpClient.get('/v2/vc-market/issuer').then((res) => Future.value(
        res.map((response) => ApiResponse.fromJson(response.data, const [
              FullType(BuiltList, [FullType(IssuerResponse)])
            ]).result.toList() as List<IssuerResponse>)));
  }

  Future<Optional<HealthCertificationToken>> applyVc(
      String url, String did, String name, String phone) {
    return _httpClient.post(url, {
      'did': did,
      'name': name,
      'phone': phone,
    }).then((res) => Future.value(res.map((response) => ApiResponse.fromJson(
            response.data, [const FullType(HealthCertificationToken)]).result
        as HealthCertificationToken)));
  }
}

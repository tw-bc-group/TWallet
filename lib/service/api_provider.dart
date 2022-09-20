import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/models/issuer_response.dart';
import 'package:tw_wallet_ui/models/ssi/verifiable_presentation.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';

class ApiProvider {
  final HttpClient _httpClient = g.Get.find();

  Future<void> transferDcepV2(
    String from,
    String publicKey,
    String signedRawTx,
  ) {
    return _httpClient.post(
      '/v2/token/transfer',
      {
        'fromAddress': from,
        'fromPublicKey': publicKey,
        'signedTransactionRawData': signedRawTx,
      },
      throwError: true,
    );
  }

  Future<Dcep> redeemDcepV2(String address, DcepType type) {
    return _httpClient.post_(
      '/v2/token/mint',
      {'address': address, 'moneyType': type.toString()},
    ).then(
      (response) => ApiResponse.fromJson(response.data, const [FullType(Dcep)])
          .result as Dcep,
    );
  }

  Future<List<Dcep>> fetchDcepV2(
    String address,
  ) {
    return _httpClient.get_('/v2/token?address=$address', loading: false).then(
          (response) => (ApiResponse.fromJson(response.data, const [
            FullType(BuiltList, [FullType(Dcep)])
          ]).result as BuiltList)
              .toList() as List<Dcep>,
        );
  }

  Future<TwBalance> fetchPointV1({
    required String address,
    bool? withLoading,
  }) async {
    return _httpClient
        .get_('/v1/token/$address', loading: withLoading ?? true)
        .then((response) {
      return ApiResponse.fromJson(
        response.data,
        const [FullType(TwBalance)],
      ).result as TwBalance;
    });
  }

  Future<Contract> fetchContractAbiV1({
    required String contractName,
  }) async {
    return _httpClient
        .get_('/v1/contracts/$contractName', loading: false, throwError: true)
        .then((response) {
      return ApiResponse.fromJson(
        response.data,
        const [
          FullType(Contract),
        ],
      ).result as Contract;
    });
  }

  Future<Response> transferPoint(
    String fromAddress,
    String publicKey,
    String signedRawTx,
  ) {
    return _httpClient.post_('/v1/token/transfer', {
      'fromAddress': fromAddress,
      'fromPublicKey': publicKey,
      'signedTransactionRawData': signedRawTx
    });
  }

  Future<List<Transaction>> fetchTxList(String fromAddress) async {
    return _httpClient
        .get_('/v1/transactions?from_addr=$fromAddress', throwError: true)
        .then((response) {
      return (ApiResponse.fromJson(response.data, const [
        FullType(BuiltList, [FullType(Transaction)])
      ]).result as BuiltList)
          .toList() as List<Transaction>;
    });
  }

  Future<Transaction> fetchTxDetails({required String txHash}) async {
    return _httpClient.get_('/v1/transactions/$txHash').then((response) {
      return ApiResponse.fromJson(response.data, [const FullType(Transaction)])
          .result as Transaction;
    });
  }

  Future<HealthCertificationToken> healthCertificate(
    String did,
    String phone,
    double temperature,
    String contact,
    String symptoms,
  ) {
    return _httpClient.post_('/v1/health-certifications', {
      'did': did,
      'phone': phone,
      'temperature': temperature,
      'contact': contact,
      "symptoms": symptoms
    }).then(
      (response) => ApiResponse.fromJson(
        response.data,
        [const FullType(HealthCertificationToken)],
      ).result as HealthCertificationToken,
    );
  }

  Future<Optional<HealthCertificationToken>> fetchHealthCertificate(
    String did,
  ) {
    return _httpClient.get('/v1/health-certifications/$did').then(
          (res) => res.map(
            (response) => ApiResponse.fromJson(
              response.data,
              [const FullType(HealthCertificationToken)],
            ).result as HealthCertificationToken,
          ),
        );
  }

  Future<Response> verifyHealthCertificationToken(String token) {
    return _httpClient
        .post_('/v1/health-certifications/verify', {'token': token});
  }

  Future<Response> issuePoints(String address) {
    return _httpClient
        .post_('/v1/token/reward', {'address': address, 'amount': 10});
  }

  Future<Optional<List<IssuerResponse>>> fetchIssuers() {
    return _httpClient.get('/v2/vc-market/issuers').then(
          (res) => res.map(
            (response) => (ApiResponse.fromJson(response.data, const [
              FullType(BuiltList, [FullType(IssuerResponse)])
            ]).result as BuiltList)
                .toList() as List<IssuerResponse>,
          ),
        );
  }

  Future<Optional<HealthCertificationToken>> applyVc(
    String vcTypeId,
    String issuerId,
    String did,
    String name,
    String phone,
  ) {
    return _httpClient.post('/v2/vc-market/vcs', {
      'did': did,
      'issueId': issuerId,
      'name': name,
      'phone': phone,
      'vcType': vcTypeId,
    }).then(
      (res) => res.map(
        (response) => ApiResponse.fromJson(
          response.data,
          [const FullType(HealthCertificationToken)],
        ).result as HealthCertificationToken,
      ),
    );
  }

  Future<Optional<Response>> patchVerifier(
    String id,
    String name,
    List<VcType> vcTypes,
  ) {
    final List<String> vcTypesList = vcTypes.map((v) => v.id).toList();
    return _httpClient.patch('/v2/vc-market/verifiers/${id}', {
      "name": name,
      "vcTypes": vcTypesList,
    });
  }

  String verifiersVcQrPath(String verifierId) {
    return "${Application.globalEnv.apiGatewayBaseUrl}/v2/vc-market/verifiers/${verifierId}/vc";
  }

  Future<Optional<Response>> verifierTravelBadgeVerify(
    String verifierId,
    String token,
  ) {
    return _httpClient.post(
      '/v2/verifier/travel-badge/verify',
      {
        "verifierId": verifierId,
        "token": token,
      },
      throwError: true,
    );
  }

  Future<VerifiableCredentialTokenResponse> verifyAndGetPassport(
    String verifierId,
    List<String?> tokens,
  ) {
    return _httpClient
        .post_(
          '/v2/verifier/health-certification/verify?simple=true',
          {
            "verifierId": verifierId,
            "tokens": tokens,
          },
          throwError: true,
        )
        .then(
          (response) => ApiResponse.fromJson(
            response.data,
            [const FullType(VerifiableCredentialTokenResponse)],
          ).result as VerifiableCredentialTokenResponse,
        );
  }

  Future<VerifiablePresentation> fetchVP(String url) {
    return _httpClient.get_(url, throwError: true).then(
          (response) => ApiResponse.fromJson(
            response.data,
            [const FullType(VerifiablePresentation)],
          ).result as VerifiablePresentation,
        );
  }
}

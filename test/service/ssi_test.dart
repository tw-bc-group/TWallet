import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as g;
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/models/ssi/verifiable_presentation.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

import 'api_provider_test.mocks.dart';

void main() {
  g.Get.put<HttpClient>(MockHttpClient());
  final HttpClient httpClient = g.Get.find();
  final ApiProvider apiProvider = ApiProvider();

  test('Returns verifialble presentations', () async {
    const id = "did:tw:816F81681dC8dd12039c05B0093ccce24B4215f4";
    const url = '/v2/vc-market/verifiers/${id}/vc';
    when(httpClient.get_(url, throwError: true)).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: {
          'code': 200,
          'msg': 'SUCCESS',
          'result': {
            "@context": "https://schema.org",
            "@type": "RegisterAction",
            "agent": {
              "@type": "Hospital",
              "legalName": "XXXXX",
              "location": "北京市海淀区...",
              "telephone": "010-88888888",
              "taxID": "123456789"
            },
            "location": "门诊楼",
            "result": {
              "@type": "Permit",
              "name": "门诊楼通行证",
              "identifier": "用户did",
              "issuedBy": "",
              "validIn": "",
              "validUntil": "",
              "potentialAction": ""
            },
            "target": {
              "@type": "EntryPoint",
              "name": "XXXXX后端",
              "identifier": "did:tw:816F81681dC8dd12039c05B0093ccce24B4215f4",
              "url":
                  "https://wallet.cn.blockchain.thoughtworks.cn/v2/verifier/health-certification/verify"
            },
            "object": {
              "@type": "ItemList",
              "name": "VC Types",
              "description": "id of VC types",
              "itemListElement": []
            }
          }
        },
        requestOptions: RequestOptions(path: ''),
      ),
    );

    expect(await apiProvider.fetchVP(url), isA<VerifiablePresentation>());
  });
}

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as g;
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/models/ssi/verifiable_presentation.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/ssi.dart';

import 'api_provider_test.mocks.dart';

void main() {
  g.Get.put<HttpClient>(MockHttpClient());
  final HttpClient httpClient = g.Get.find();
  final ApiProvider apiProvider = ApiProvider();
  g.Get.put<ApiProvider>(apiProvider);

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
    final vp =
        await SsiService.createVerifiableCredentialPresentationRequest(url);
    expect(vp, isA<VerifiableCredentialPresentationRequest>());
  });

  test('Verify then returns Passport token', () async {
    const verifierId = 'did:tw:816F81681dC8dd12039c05B0093ccce24B4215f4';
    const tokens = ['', ''];
    when(
      httpClient.post(
        '/v2/verifier/health-certification/verify?simple=true',
        {
          "verifierId": verifierId,
          "tokens": tokens,
        },
        throwError: true,
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: {
          'code': 200,
          'msg': 'SUCCESS',
          'result': {
            'token':
                'eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IkRJRDpUVzoybVBYaFAyQVY3MkM0NE1jcUN6djg1R05HTnJFUXVDc0F5a3pkRHZTIiwidmVyIjoiMC4xIiwiaXNzIjoiRElEOlRXOmNBODQzNTY5ZTM0MjcxNDRjRWFkNWU0ZDU5OTlhM0QwY0NGOTJCOGUiLCJpYXQiOjE1OTAwNDU4NjksImV4cCI6MTU5MDA0NjE2OSwidHlwIjpbIkhlYWx0aHlDcmVkZW50aWFsIl0sInN1YiI6eyJpZCI6IkRJRDpUVzo3MjY3NjJlNTM5OGJjOTgzMjYzYTQ5RUNkMTM4MjI1RjIyOTFjNTBDIiwicGhvbmUiOiIxMzgwMDAwMDAwMSIsInRlbXBlcmF0dXJlIjozNy4wLCJjb250YWN0IjoiTk8iLCJzeW1wdG9tcyI6Ik5PIiwiaGVhbHRoeVN0YXR1cyI6eyJ0eXAiOiJIZWFsdGh5U3RhdHVzIiwidmFsIjoiaGVhbHRoeSJ9fSwiQGNvbnRleHQiOlsiaHR0cHM6Ly9ibG9ja2NoYWluLnRob3VnaHR3b3Jrcy5jbi9jcmVkZW50aWFscy92MS8iXX0=.MDFjNTE0MTBhMWRhMTViNTM1ZDE2ZGY3NDEzZDJlMjY5ODM5N2VlN2Q5NTcxNjBjYTk1MGZjMjY4YTkwYzgxNzI3MmE4MDUyN2Y5YTc2Yjg1OTY3ZDM4ZjYzY2Y3ZGNmYjExNmQyOTdjNjc5Yzk2MGRhMjRiYWZlYmQ5YTBkOWVlYQ=='
          }
        },
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final token = await SsiService.verifyAndGetPassport(verifierId, tokens);
    expect(token, isA<VerifiableCredentialTokenResponse>());
  });
}

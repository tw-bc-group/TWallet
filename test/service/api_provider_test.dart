import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as g;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/health_certification_token.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

import 'api_provider_test.mocks.dart';

// see https://github.com/dart-lang/mockito/blob/master/NULL_SAFETY_README.md
@GenerateMocks([HttpClient])
void main() {
  g.Get.put<HttpClient>(MockHttpClient());

  final HttpClient httpClient = g.Get.find();
  final ApiProvider apiProvider = ApiProvider();
  const address = '0xed9d02e382b34818e88B88a309c7fe71E65f419d';

  test('Return a Contract Instance', () async {
    const contractName = 'test-name';
    when(
      httpClient.get_(
        '/v1/contracts/$contractName',
        loading: false,
        throwError: true,
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: {
          'code': 200,
          'msg': 'OK',
          'result': {'name': contractName, 'address': 'address', 'abi': 'abi'}
        },
        requestOptions: RequestOptions(path: ''),
      ),
    );

    expect(
      await apiProvider.fetchContractAbiV1(contractName: contractName),
      isA<Contract>(),
    );
  });

  test('Return a TwBalance Instance', () async {
    const url = '/v1/token/$address';
    when(httpClient.get_(url, loading: false)).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: {
          'code': 200,
          'msg': 'SUCCESS',
          'result': {
            'balance': '10000000000000000000000',
            'twpoint': {
              'name': 'TWPointERC20Token',
              'symbol': 'TWP',
              'decimal': 18
            }
          }
        },
        requestOptions: RequestOptions(path: ''),
      ),
    );

    expect(
      await apiProvider.fetchPointV1(address: address, withLoading: false),
      isA<TwBalance>(),
    );
  });

  test('Return a List Of Transactions Instances', () async {
    const url = '/v1/transactions?from_addr=$address';
    when(httpClient.get_(url, throwError: true)).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: {
          'code': 200,
          'msg': 'SUCCESS',
          'result': [
            {
              "hash":
                  "0x454971ef7eb2377ce00ca2686ab4f6c752e1a437ecf6edb363fff0ca0471ca92",
              "tx_type": "Transfer",
              "amount": "2000000000000000000",
              "create_time": "2020-04-24 06:47:18",
              "from_address": "0x55e9f09e71e33adce530c888f3e1f303bc257248",
              "to_address": "0xc2583ac729840311e32fac95f0fc9076b302f94f",
            }
          ]
        },
        requestOptions: RequestOptions(path: ''),
      ),
    );

    expect(
      await apiProvider.fetchTxList(address),
      isA<List<Transaction>>(),
    );
  });

  test('Return a Transactions Instance', () async {
    const txHash =
        '0x13232ba90547279d00b30511ba4ca6c6f4ad08f27c22d75872d60c16fabd6ee5';
    const url = '/v1/transactions/$txHash';
    when(httpClient.get(url)).thenAnswer(
      (_) async => Optional.of(
        Response(
          statusCode: 200,
          data: {
            'code': 200,
            'msg': 'SUCCESS',
            'result': {
              "hash":
                  "0x454971ef7eb2377ce00ca2686ab4f6c752e1a437ecf6edb363fff0ca0471ca92",
              "tx_type": "Transfer",
              "amount": "2000000000000000000",
              "create_time": "2020-04-24 06:47:18",
              "from_address": "0x55e9f09e71e33adce530c888f3e1f303bc257248",
              "to_address": "0xc2583ac729840311e32fac95f0fc9076b302f94f",
            }
          },
          requestOptions: RequestOptions(path: ''),
        ),
      ),
    );

    expect(
      await apiProvider.fetchTxDetails(txHash: txHash),
      isA<Optional<Transaction>>(),
    );
  });

  test(
      'When send a health certificate request, should be return a HealthCertification instance',
      () async {
    const String phone = '13888888888';
    const String did = '123456789';
    const double temperature = 37.1;
    const String contact = 'Yes';
    const String symptoms = 'No';

    when(
      httpClient.post('/v1/health-certifications', {
        'did': did,
        'phone': phone,
        'temperature': temperature,
        'contact': contact,
        "symptoms": symptoms
      }),
    ).thenAnswer(
      (_) async => Optional.of(
        Response(
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
      ),
    );

    expect(
      await apiProvider.healthCertificate(
        did,
        phone,
        temperature,
        contact,
        symptoms,
      ),
      isA<Optional<HealthCertificationToken>>(),
    );
  });
}

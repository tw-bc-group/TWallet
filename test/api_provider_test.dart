import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';

void main() {
  getItInit(isTest: true);

  final _httpClient = getIt<HttpClient>();
  final _apiProvider = getIt<ApiProvider>();
  final address = '0xed9d02e382b34818e88B88a309c7fe71E65f419d';

  test('Return a Contract Instance', () async {
    final _contractName = 'test-name';
    when(_httpClient.get('/v1/contracts/$_contractName', loading: false))
        .thenAnswer((_) async => Response(statusCode: 200, data: {
              'code': 200,
              'msg': 'OK',
              'result': {
                'name': _contractName,
                'address': 'address',
                'abi': 'abi'
              }
            }));

    expect(await _apiProvider.fetchContractAbiV1(contractName: _contractName),
        isA<Contract>());
  });

  test('Return a TwBalance Instance', () async {
    final url = '/v1/token/$address';
    when(_httpClient.get(url, loading: false))
        .thenAnswer((_) async => Response(statusCode: 200, data: {
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
            }));

    var res = await _apiProvider.fetchPointV1(address: address);
    expect(res, isA<TwBalance>());
  });

  test('Return a List Of Transactions Instances', () async {
    final url = '/v1/transactions?from_addr=$address';
    when(_httpClient.get(url))
        .thenAnswer((_) async => Response(statusCode: 200, data: {
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
            }));

    expect(await _apiProvider.fetchTxList(address), isA<List<Transaction>>());
  });

  test('Return a Transactions Instance', () async {
    final txHash =
        '0x13232ba90547279d00b30511ba4ca6c6f4ad08f27c22d75872d60c16fabd6ee5';
    final url = '/v1/transactions/$txHash';
    when(_httpClient.get(url))
        .thenAnswer((_) async => Response(statusCode: 200, data: {
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
            }));

    expect(
        await _apiProvider.fetchTxDetails(txHash: txHash), isA<Transaction>());
  });

  test(
      'When send a health certificate request, should be return a HealthCertification instance',
      () async {
    final String phone = '13888888888';
    final String did = '123456789';
    final double temperature = 37.1;
    final String contact = 'Yes';
    final String symptoms = 'No';

    when(_httpClient.post('/v1/health-certifications', {
      'did': did,
      'phone': phone,
      'temperature': temperature,
      'contact': contact,
      "symptoms": symptoms
    })).thenAnswer((_) async => Response(statusCode: 200, data: {
          'code': 200,
          'msg': 'SUCCESS',
          'result': {
            '@context': ['String'],
            'id': 'did',
            'ver': '0.1',
            'iss': 'null',
            'iat': 123,
            'exp': 123,
            'typ': ['HealthyStatus'],
            'sub': {
              'id': 'did',
              'phone': 'aaa',
              'healthyStatus': {'typ': 'HealthyStatus', 'val': 'unhealthy'}
            }
          }
        }));

    expect(
        await _apiProvider.healthCertificate(
            did, phone, temperature, contact, symptoms),
        isA<HealthCertification>());
  });
}

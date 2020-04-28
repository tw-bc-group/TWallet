import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/http/http_client.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/models/contract.dart';
import 'package:tw_wallet_ui/models/transaction.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

void main() {
  getItInit(isTest: true);

  final _httpClient = getIt<HttpClient>();
  print('_httpClient: $_httpClient');
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
    final url = '/v1/tw-points/$address';
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
}

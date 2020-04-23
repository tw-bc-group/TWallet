import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/service/api_provider.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';

class MockDio extends Mock implements Dio {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<Dio>(MockDio());
  getIt.registerSingleton<ApiProvider>(ApiProvider());

  group('TW Point', () {
    test('Value should be 10000', () {
      var strJson =
          '{"balance": "10000000000000000000000", "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}}';
      var balance = TwBalance.fromJson(json.decode(strJson));
      expect(balance.realBalance, Decimal.parse('10000'));
      expect(balance.humanBalance, '10000.00');
    });

    test('Value should be 10000.13', () {
      var strJson =
          '{"balance": "10000126000000000000000", "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}}';
      var balance = TwBalance.fromJson(json.decode(strJson));
      expect(balance.realBalance, Decimal.parse('10000.126'));
      expect(balance.humanBalance, '10000.13');
    });

    test('Value should be 0.00', () {
      var strJson =
          '{"balance": "0", "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}}';
      var balance = TwBalance.fromJson(json.decode(strJson));
      expect(balance.realBalance, Decimal.parse('0'));
      expect(balance.humanBalance, '0.00');
    });
  });

  group('Fetch TW Point', () {
    final dio = getIt<Dio>();
    final address = '0xed9d02e382b34818e88B88a309c7fe71E65f419d';
    final url = '/v1/tw-points/' + address;

    test('returns a TwBalance Instance if the http call completes successfully',
        () async {
      when(dio.get(url)).thenAnswer((_) async => Response(
          statusCode: 200,
          data: json.decode(
              '{"code": 200, "msg": "OK", "result": {"balance": "10000000000000000000000", "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}}}')));

      var res = await TwBalance.fetchBalance(address: address);
      expect(res, isA<TwBalance>());
    });

    // Note: if test throws exception, remove await for async functions, and use throwsException to match result
    test('return Optional empty, if the http call completes with an error',
        () async {
      when(dio.get(url)).thenAnswer(
          (_) async => Response(statusCode: 404, data: 'Not Found'));

      expect(TwBalance.fetchBalance(address: address), throwsException);
    });
  });
}

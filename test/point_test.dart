import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('TW Point', () {
    test('Value should be 10000', () {
      var strJson =
          '{"code": 200, "msg": "OK", "result": {"address": "0xed9d02e382b34818e88B88a309c7fe71E65f419d", "balance": "10000000000000000000000", "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}}}';
      var point = TwPoint.fromJson(json.decode(strJson));
      expect(point.value, Decimal.parse('10000'));
      expect(point.strValue, '10000.00');
    });

    test('Value should be 10000.13', () {
      var strJson =
          '{"code": 200, "msg": "OK", "result": {"address": "0xed9d02e382b34818e88B88a309c7fe71E65f419d", "balance": "10000126000000000000000", "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}}}';
      var point = TwPoint.fromJson(json.decode(strJson));
      expect(point.value, Decimal.parse('10000.126'));
      expect(point.strValue, '10000.13');
    });

    test('Value should be 0.00', () {
      var strJson =
          '{"code": 200, "msg": "OK", "result": {"address": "0xed9d02e382b34818e88B88a309c7fe71E65f419d", "balance": "0", "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}}}';
      var point = TwPoint.fromJson(json.decode(strJson));
      expect(point.value, Decimal.parse('0'));
      expect(point.strValue, '0.00');
    });
  });

  group('Fetch TW Point', () {
    final dio = MockDio();
    final address = '0xed9d02e382b34818e88B88a309c7fe71E65f419d';
    final url = '/v1/tw-points/' + address;

    test('returns a TwPoint if the http call completes successfully', () async {
      when(dio.get(url)).thenAnswer((_) async => Response(
          statusCode: 200,
          data:
              '{"code": 200, "msg": "OK", "result": {"address": "0xed9d02e382b34818e88B88a309c7fe71E65f419d", "balance": "10000000000000000000000", "twpoint": {"name": "TWPointERC20Token", "symbol": "TWP", "decimal": 18}}}'));

      expect(await fetchPoint(dio: dio, address: address), isA<TwPoint>());
    });

    // Note: if test throws exception, remove await for async functions, and use throwsException to match result
    test('throws an exception if the http call completes with an error',
        () async {
      when(dio.get(url)).thenAnswer(
          (_) async => Response(statusCode: 404, data: 'Not Found'));

      expect(fetchPoint(dio: dio, address: address), throwsException);
    });
  });
}

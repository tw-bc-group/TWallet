import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

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
}

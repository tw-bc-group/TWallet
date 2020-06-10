import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/webview/method_param/sign_transaction.dart';
import 'package:tw_wallet_ui/models/webview/webview_request.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';

void main() {
  getItInit(isTest: true);

  group('WebView Test', () {
    test('should return WebviewRequest type model when given a json map', () {
      const jsonMapString = '{ "id": "id", "method": "quitApp" }';
      final Map<String, dynamic> jsonMap =
          json.decode(jsonMapString) as Map<String, dynamic>;
      final request = WebviewRequest.fromJson(jsonMap);
      expect(request is WebviewRequest, isTrue);
      expect(
          request.method.toString(), WebviewRequestMethod.quitApp.toString());
    });

    test(
        'should return webview sign transaction method param model when given a correct json',
        () {
      const Map<String, dynamic> serialized = {
        'rpcUrl': 'http://localhost:7070',
        'abi': '{"a": "a", "b" : "b"}',
        'function': 'functionName',
        'gasPrice': 1000,
        'maxGas': 3000000,
        'parameters': ['1', 2],
      };

      expect(WebviewSignTransaction.fromJson(serialized),
          isA<WebviewSignTransaction>());
    });
  });
}

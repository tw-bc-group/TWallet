import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/sign_transaction.dart';
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
        'should return webview sign transaction method param model when given a correct json map',
        () {
      const Map<String, dynamic> serialized = {
        'transactionInfo': {
          'accountId': '883ebda0-aae4-11ea-d97e-79963447eb89',
          'rpcUrl': 'http://quorum.tw-wallet.in2e.com:22000',
          'contractName': 'DC/EP',
          'contractAddress': '0x9d13C6D3aFE1721BEef56B55D303B09E021E27ab',
          'contractAbi':
              '{ "constant":false, "inputs":[ { "name":"recipient", "type":"address" }, { "name":"amount", "type":"uint256" } ], "name":"transfer", "outputs":[ { "name":"", "type":"bool" } ], "payable":false, "stateMutability":"nonpayable", "type":"function" }',
          'functionName': 'functionName',
          'gasPrice': '0',
          'maxGas': 4500000,
          'parameters': [
            {
              'type': 'ethAddress',
              'value': '0x9d13C6D3aFE1721BEef56B55D303B09E021E27ab'
            },
            {'type': 'bigInt', 'value': '1'}
          ]
        },
        'pincodeStyle': {
          'closeIcon': {'color': '#dddddd', 'size': 20},
          'errorMsg': {'color': '#dddddd', 'fontSize': 12},
          'hintMsg': {'text': '', 'color': '#dddddd', 'fontSize': 12},
          'inputFields': {
            'borderWidth': 1,
            'borderRadius': 8,
            'size': 40,
            'textColor': '#dddddd',
            'borderColor': '#dddddd',
            'activeBorderColor': '#dddddd',
            'selectedBorderColor': '#dddddd',
            'filledColor': '#dddddd',
            'activeFillColor': '#dddddd',
            'selectedFillColor': '#dddddd'
          },
          'title': {'text': '', 'color': '#dddddd', 'fontSize': 16},
        }
      };

      expect(WebviewSignTransaction.fromJson(serialized),
          isA<WebviewSignTransaction>());
    });
  });
}

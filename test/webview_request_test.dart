import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/webview/webview_request.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_type.dart';

void main() {
  getItInit(isTest: true);

  test('should return WebviewRequest type model when given a json map', () {
    const jsonMapString = '{ "id": "id", "method": "quitApp" }';
    Map<String, dynamic> jsonMap = json.decode(jsonMapString);
    var request = WebviewRequest.fromJson(jsonMap);
    expect(request is WebviewRequest, isTrue);
    expect(request.method.toString(), WebviewRequestType.quitApp.toString());
  });
}
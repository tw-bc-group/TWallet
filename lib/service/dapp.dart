import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DAppService {
  static BuildContext context;
  static WebViewController webviewController;

  static Function getOperator(WebviewRequestMethod method) {
    switch (method) {
      case WebviewRequestMethod.quitApp:
        return quitApp;
    }

    throw ArgumentError.value(method.toString(), 'unexpected method');
  }

  static void quitApp(String id) {
    Application.router.pop(context);
  }

  void resolve(String id, dynamic data) {
    webviewController
        .evaluateJavascript('window.ThoughtWallet.resolvePromise($id, $data);');
  }

  void reject(String id, dynamic data) {
    webviewController
        .evaluateJavascript('window.ThoughtWallet.rejectPromise($id, $data);');
  }
}

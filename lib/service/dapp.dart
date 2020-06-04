import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_type.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:tw_wallet_ui/common/application.dart';

class DAppService {
  static BuildContext context;
  static WebViewController webviewController;

  static Function getOperator(String funcName) {
    if (funcName == WebviewRequestType.quitApp.toString()) return quitApp;
    throw ArgumentError.value(funcName, 'method');
  }

  static void quitApp(String id) {
    Application.router.pop(context);
  }

  void resolve(String id, dynamic data) {
    webviewController.evaluateJavascript('window.ThoughtWallet.resolvePromise($id, $data);');
  }

  void reject(String id, dynamic data) {
    webviewController.evaluateJavascript('window.ThoughtWallet.rejectPromise($id, $data);');
  }
}
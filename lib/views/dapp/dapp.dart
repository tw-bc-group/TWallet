import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tw_wallet_ui/models/webview/webview_request.dart';
import 'package:tw_wallet_ui/service/dapp.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DAppPage extends StatelessWidget {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  JavascriptChannel _nativeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'ThoughtWalletNative',
      onMessageReceived: (JavascriptMessage message) {
        try {
          final Map<String, dynamic> requestJson = jsonDecode(message.message) as Map<String, dynamic>;
          final WebviewRequest webviewRequest = WebviewRequest.fromJson(requestJson);
          DAppService.getOperator(webviewRequest.method.toString()).call(webviewRequest.id);
        } catch (e) {
          _controller.future.then((webviewController) => webviewController.evaluateJavascript('window.ThoughtWallet.rejectPromise($e);'));
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Builder(builder: (BuildContext context) {
          return WebView(
            initialUrl: 'http://127.0.0.1:3000/',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
              DAppService.webviewController = webViewController;
            },
            javascriptChannels: <JavascriptChannel>{
              _nativeJavascriptChannel(context),
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          );
        }),
      )
    );
  }
}
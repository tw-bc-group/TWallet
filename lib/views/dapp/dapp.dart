import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DAppPage extends StatelessWidget {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  JavascriptChannel _nativeJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'ThoughtWalletNative',
      onMessageReceived: (JavascriptMessage message) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
        _controller.future.then((webviewController) => webviewController.evaluateJavascript('window.resolveFunc("aa");'));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView example'),
        // actions: <Widget>[
        //   NavigationControls(_controller.future),
        //   SampleMenu(_controller.future),
        // ],
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: 'http://127.0.0.1:3000/',
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          // TODO(iskakaushik): Remove this when collection literals makes it to stable.
          // ignore: prefer_collection_literals
          javascriptChannels: <JavascriptChannel>[
            _nativeJavascriptChannel(context),
          ].toSet(),
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          gestureNavigationEnabled: true,
        );
      }),
    );
  }
}
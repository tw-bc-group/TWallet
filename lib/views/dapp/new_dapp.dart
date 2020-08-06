import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:tw_wallet_ui/common/dapp_list.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/webview/webview_request.dart';
import 'package:tw_wallet_ui/service/dapp.dart';
// import 'package:tw_wallet_ui/views/dapp/dapp.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class NewDAppPage extends StatefulWidget {
  final String id;
  const NewDAppPage({this.id});

  @override
  State<StatefulWidget> createState() {
    return NewDAppPageState();
  }
}

class NewDAppPageState extends State<NewDAppPage> {
  final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  // final Completer<WebViewController> _controller =
  //     Completer<WebViewController>();
  bool isLoadingPage = true;
  Color backgroundColor = Colors.white;

  final Set<JavascriptChannel> jsChannels = [
    JavascriptChannel(
        name: 'TWalletNative',
        onMessageReceived: (JavascriptMessage message) {
          try {
            final Map<String, dynamic> requestJson =
                jsonDecode(message.message) as Map<String, dynamic>;
            final WebviewRequest webviewRequest =
                WebviewRequest.fromJson(requestJson);
            DAppService.getOperator(webviewRequest.method)
                .call(webviewRequest.id, webviewRequest.param);
          } catch (e) {
            final FlutterWebviewPlugin flutterWebviewPlugin =
                FlutterWebviewPlugin();
            flutterWebviewPlugin.evalJavascript(
                'window.TWallet.rejectPromise(${json.encode(json.encode(e.toString()))});');
          }
        })
  ].toSet();

  @override
  void initState() {
    super.initState();

    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (state.type == WebViewState.startLoad) {
        flutterWebviewPlugin.evalJavascript(
            'window._wallet_dapp_id = ${json.encode(widget.id)}');
      }
      if (state.type == WebViewState.finishLoad) {
        flutterWebviewPlugin.evalJavascript(
            'window._wallet_dapp_id = ${json.encode(widget.id)}');
      }
    });

    DAppService.setStatusBarMode('id', 'dark');
  }

  DAppInfo getDappById(String id) {
    return dappList.firstWhere((dapp) => dapp.id == id);
  }

  // Future<bool> onBack() async {
  //   if (!_controller.isCompleted) {
  //     resetToAppStatusBar();
  //     return true;
  //   }
  //   final webViewController = await _controller.future;
  //   final webViewCanGoBack = await webViewController.canGoBack();
  //   if (webViewCanGoBack) {
  //     webViewController.goBack();
  //     return false;
  //   }
  //   resetToAppStatusBar();
  //   return true;
  // }

  void finishLoading() {
    setState(() {
      isLoadingPage = false;
    });
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      backgroundColor = color;
    });
  }

  void resetToAppStatusBar() {
    DAppService.setStatusBarMode('id', 'dark');
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: WalletColor.primary,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // onWillPop: onBack,
      child: WebviewScaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context),
          child: Container(
            height: DeviceInfo.isIphoneXSeries() ? 34 : 0,
            color: WalletColor.white,
          ),
        ),
        javascriptChannels: jsChannels,
        url: getDappById(widget.id)?.url,
        withLocalStorage: true,
        initialChild: Container(
          alignment: FractionalOffset.center,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(WalletColor.primary)),
        ),
      ),
    );
  }
}

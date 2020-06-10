import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef OperatorFunction = void Function(String id, String param);

class DAppService {
  static BuildContext context;
  static WebViewController webviewController;

  static OperatorFunction getOperator(WebviewRequestMethod method) {
    switch (method) {
      case WebviewRequestMethod.quitApp:
        return quitApp;
      case WebviewRequestMethod.createAccount:
        return createAccount;
      case WebviewRequestMethod.qrCode:
        return qrCode;
      case WebviewRequestMethod.signTransaction:
        return signTransaction;

      default:
        throw ArgumentError.value(method.toString(), 'unexpected method');
    }
  }

  static void quitApp(String id, _) {
    Application.router.pop(context);
  }

  static void signTransaction(String id, String param) {}

  static Future<void> qrCode(String id, _) async {
    resolve(
        id,
        Optional.ofNullable(
                await Application.router.navigateTo(context, Routes.qrScanner))
            .orElse(''));
  }

  static void createAccount(String id, _) {
    final MnemonicsStore _mnemonicsStore = getIt<MnemonicsStore>();
    final IdentityStore _identityStore = getIt<IdentityStore>();
    _mnemonicsStore.generateKeys((keys) =>
        Future.value(Identity((identity) => identity
              ..id = Uuid().v1()
              ..name = id
              ..pubKey = keys.first
              ..priKey = keys.second
              ..fromDApp = true))
            .then((value) => _identityStore.addIdentity(identity: value))
            .then((Identity value) {
          final Map<String, dynamic> resultJson = {
            'id': value.id,
            'address': value.address,
            'publicKey': value.pubKey,
            'index': _mnemonicsStore.index
          };
          resolve(id, resultJson);
        }));
  }

  static void resolve(String id, dynamic data) {
    webviewController.evaluateJavascript(
        'window.ThoughtWallet.resolvePromise("$id", \'${json.encode(data)}\')');
  }

  static void reject(String id, dynamic data) {
    webviewController.evaluateJavascript(
        'window.ThoughtWallet.rejectPromise("$id", \'$data\');');
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DAppService {
  static BuildContext context;
  static WebViewController webviewController;

  static Function getOperator(WebviewRequestMethod method) {
    switch (method) {
      case WebviewRequestMethod.quitApp:
        return quitApp;
      case WebviewRequestMethod.createAccount:
        return createAccount;

      default:
        throw ArgumentError.value(method.toString(), 'unexpected method');
    }
  }

  static void quitApp(String id) {
    Application.router.pop(context);
  }

  static void createAccount(String id) {
    final MnemonicsStore store = getIt<MnemonicsStore>();
    final IdentityStore _identityStore = getIt<IdentityStore>();
    store.generateKeys((keys) => Future.value(Identity((identity) => identity
              ..id = Uuid().v1()
              ..name = id
              ..pubKey = keys.first
              ..priKey = keys.second
              ..fromDApp = true))
            .then((value) => _identityStore.addIdentity(identity: value))
            .then((Identity value) {
          final Map<String, String> resultJson = {
            'id': value.id,
            'address': value.address,
            'publicKey': value.pubKey
          };
          resolve(id, json.encode(resultJson));
        }));
  }

  static void resolve(String id, dynamic data) {
    webviewController.evaluateJavascript(
        'window.ThoughtWallet.resolvePromise("$id", \'$data\')');
  }

  static void reject(String id, dynamic data) {
    webviewController.evaluateJavascript(
        'window.ThoughtWallet.rejectPromise("$id", \'$data\');');
  }
}

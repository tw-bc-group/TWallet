import 'dart:convert';

import 'package:bip39/bip39.dart' as bip39;
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/services.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/webview/parameter/sign_transaction.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:uuid/uuid.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
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
      case WebviewRequestMethod.getRootKey:
        return getRootKey;
      default:
        throw ArgumentError.value(method.toString(), 'unexpected method');
    }
  }

  static void quitApp(String id, _) {
    Application.router.pop(context);
  }

  static Future<void> signTransaction(String id, String param) async {
    final WebviewSignTransaction _signTransaction =
        WebviewSignTransaction.fromJson(json.decode(param));
    final Web3Client _web3Client =
        Web3Client(_signTransaction.rpcUrl, Client());
    final Identity _identity =
        getIt<IdentityStore>().getIdentityById(_signTransaction.accountId);
    final DeployedContract _contract = DeployedContract(
        ContractAbi.fromJson(
            _signTransaction.contractAbi, _signTransaction.contractName),
        EthereumAddress.fromHex(_signTransaction.contractAddress));

    await _web3Client
        .credentialsFromPrivateKey(_identity.priKey)
        .then((credentials) {
      return _web3Client
          .signTransaction(
              credentials,
              Transaction.callContract(
                contract: _contract,
                function: _contract.function(_signTransaction.functionName),
                parameters: _signTransaction.parameters
                    .map((p) => p.realType())
                    .toList(),
                gasPrice: EtherAmount.zero(),
                maxGas: 3000000,
              ),
              fetchChainIdFromNetworkId: true)
          .then((rawTx) => resolve(id, '0x${bytesToHex(rawTx)}'));
    });
  }

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

  static void getRootKey(String id, _) {
    final MnemonicsStore _mnemonicsStore = getIt<MnemonicsStore>();
    final walletSeed = bip39.mnemonicToSeed(_mnemonicsStore.mnemonics);
    resolve(id, sha256.convert(walletSeed).toString());
  }

  static void setStatusBarMode(String id, String param) {
    if (param == 'dark') {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
      return;
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  static void setStatusBarBackgroundColor(String id, String param) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: WalletColor.accent,
      systemNavigationBarDividerColor: WalletColor.accent,
      statusBarColor: WalletColor.accent
    ));
  }

  static void resolve(String id, dynamic data) {
    webviewController.evaluateJavascript(
        'window.ThoughtWallet.resolvePromise("$id", \'${json.encode(data)}\')');
  }

  static void reject(String id, dynamic data) {
    webviewController.evaluateJavascript(
        'window.ThoughtWallet.rejectPromise("$id", \'${json.encode(data)}\');');
  }
}

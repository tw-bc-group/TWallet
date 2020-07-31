import 'dart:convert';

import 'package:bip39/bip39.dart' as bip39;
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt_tool;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/services.dart';
import 'package:more/tuple.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/models/webview/create_account_param.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/sign_transaction.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/pincode.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/dapp/dapp.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef OperatorFunction = void Function(String id, String param);

class DAppService {
  static BuildContext context;
  static WebViewController webviewController;
  static DAppPageState dappPageStateInstance;

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
      case WebviewRequestMethod.setStatusBarMode:
        return setStatusBarMode;
      case WebviewRequestMethod.setStatusBarBackgroundColor:
        return setStatusBarBackgroundColor;
      case WebviewRequestMethod.peekAccount:
        return peekAccount;
      case WebviewRequestMethod.getAccounts:
        return getAccounts;
      case WebviewRequestMethod.getAccountById:
        return getAccountById;
      case WebviewRequestMethod.getAccountByIds:
        return getAccountByIds;
      case WebviewRequestMethod.validatePin:
        return validatePin;
      default:
        throw ArgumentError.value(method.toString(), 'unexpected method');
    }
  }

  static void quitApp(String id, _) {
    setStatusBarMode(id, 'dark');
    Application.router.pop(context);
  }

  static Future<void> signTransaction(String id, String param) async {
    try {
      final WebviewSignTransaction _signTransaction =
          WebviewSignTransaction.fromJson(json.decode(param));
      final pincodeValidate = await PincodeService.validate(
          _signTransaction.token, _signTransaction.pincodeDialogStyle);
      if (pincodeValidate == null) {
        return reject(id, '');
      }
      final _transactionInfo = _signTransaction.transactionInfo;
      final Web3Client _web3Client =
          Web3Client(_transactionInfo.rpcUrl, Client());
      final Identity _identity =
          getIt<IdentityStore>().getIdentityById(_transactionInfo.accountId);
      final DeployedContract _contract = DeployedContract(
          ContractAbi.fromJson(
              _transactionInfo.contractAbi, _transactionInfo.contractName),
          EthereumAddress.fromHex(_transactionInfo.contractAddress));

      final credentials =
          await _web3Client.credentialsFromPrivateKey(_identity.priKey);
      final rawTx = await _web3Client.signTransaction(
        credentials,
        Transaction.callContract(
          contract: _contract,
          function: _contract.function(_transactionInfo.functionName),
          parameters:
              _transactionInfo.parameters.map((p) => p.realType()).toList(),
          gasPrice: EtherAmount.inWei(_transactionInfo.gasPrice),
          maxGas: _transactionInfo.maxGas,
        ),
        fetchChainIdFromNetworkId: true,
      );
      resolve(
        id,
        {
          'rawData': '0x${bytesToHex(rawTx)}',
          'token': pincodeValidate is String
              ? pincodeValidate
              : _signTransaction.token
        },
      );
    } catch (err) {
      reject(id, err.toString());
    }
  }

  static Future<void> qrCode(String id, _) async {
    resolve(
        id,
        Optional.ofNullable(
                await Application.router.navigateTo(context, Routes.qrScanner))
            .orElse(''));
  }

  static void peekAccount(String id, _) {
    final Tuple3<int, String, String> _keyPair =
        getIt<MnemonicsStore>().peekKeys();
    final Identity _identity = Identity((builder) => builder
      ..name = id
      ..index = _keyPair.first
      ..pubKey = _keyPair.second
      ..priKey = _keyPair.third);
    resolve(id, _identity.basicInfo());
  }

  static void createAccount(String id, String param) {
    final CreateAccountParam createAccountParam =
        CreateAccountParam.fromJson(json.decode(param));
    final MnemonicsStore _mnemonicsStore = getIt<MnemonicsStore>();
    _mnemonicsStore.generateKeys((index, keys) =>
        Future.value(Identity((identity) => identity
              ..name = DateTime.now().millisecondsSinceEpoch.toString()
              ..pubKey = keys.first
              ..priKey = keys.second
              ..dappId = createAccountParam.dappid
              ..extra = createAccountParam.extra
              ..index = index))
            .then((identity) => identity.register().then((success) {
                  if (success) {
                    resolve(id, identity.basicInfo());
                  }
                })));
  }

  static void getRootKey(String id, _) {
    final MnemonicsStore _mnemonicsStore = getIt<MnemonicsStore>();
    final walletSeed = bip39.mnemonicToSeed(_mnemonicsStore.mnemonics);
    resolve(id, sha256.convert(walletSeed).toString());
  }

  static void setStatusBarMode(String id, String param) {
    if (param == 'dark') {
      return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  static void setStatusBarBackgroundColor(String id, String param) {
    if (DeviceInfo.isIOS()) {
      return dappPageStateInstance
          .changeBackgroundColor(WalletTheme.rgbColor(param));
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: WalletTheme.rgbColor(param),
    ));
  }

  static void getAccounts(String id, String dappid) {
    if (dappid.isEmpty) {
      resolve(id, null);
    } else {
      resolve(
          id,
          getIt<IdentityStore>()
              .identitiesWithDapp
              .where((identity) => identity.dappId == dappid)
              .map((identity) => identity.basicInfo())
              .toList());
    }
  }

  static void getAccountById(String id, String param) {
    if (param.isEmpty) {
      return resolve(id, null);
    }

    resolve(id, getIt<IdentityStore>().getIdentityById(param).basicInfo());
  }

  static void getAccountByIds(String id, String param) {
    if (param.isEmpty) {
      return resolve(id, []);
    }

    final IdentityStore _identityStore = getIt<IdentityStore>();
    final List<Map> result = [];
    param.split(',').forEach((accountId) {
      final identity = _identityStore.getIdentityById(accountId);
      result.add({
        'id': identity.id,
        'address': identity.address,
        'publicKey': identity.pubKey,
        'index': identity.index
      });
    });
    resolve(id, result);
  }

  static Future<void> validatePin(String id, String pin) async {
    final iv = encrypt_tool.IV.fromUtf8('${pin}0123456789');
    final encrypt_tool.Key aesKey =
        encrypt_tool.Key.fromUtf8('${pin}abcdefghijklmnopqrstuvwxyz');
    final encrypt = encrypt_tool.Encrypter(
        encrypt_tool.AES(aesKey, mode: encrypt_tool.AESMode.cbc));
    final String encryptedString =
        await SecureStorage.get(SecureStorageItem.masterKey);
    final encrypt_tool.Encrypted encryptedKey =
        encrypt_tool.Encrypted.fromBase64(encryptedString);
    try {
      encrypt.decrypt(encryptedKey, iv: iv);
      resolve(id, true);
    } catch (error) {
      resolve(id, false);
    }
  }

  static void resolve(String id, dynamic data) {
    webviewController.evaluateJavascript(
        'window.TWallet.resolvePromise("$id", ${json.encode(json.encode(data))})');
  }

  static void reject(String id, dynamic data) {
    webviewController
        // ignore: avoid_escaping_inner_quotes
        .evaluateJavascript(
            'window.TWallet.rejectPromise("$id", ${json.encode(json.encode(data))});');
  }
}

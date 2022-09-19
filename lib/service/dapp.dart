import 'dart:convert';

import 'package:bip39/bip39.dart' as bip39;
import 'package:built_value/serializer.dart';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as encrypt_tool;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:more/tuple.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/models/send_transaction_response.dart';
import 'package:tw_wallet_ui/models/webview/create_account_param.dart';
import 'package:tw_wallet_ui/models/webview/send_transaction_request.dart';
import 'package:tw_wallet_ui/models/webview/sign_transaction/sign_transaction.dart';
import 'package:tw_wallet_ui/models/webview/webview_request_method.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/pincode.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/dapp/dapp.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef OperatorFunction = void Function(String id, String? param);

class DAppService {
  static BuildContext? context;
  static WebViewController? webviewController;
  static DAppPageState? dappPageStateInstance;
  static String? dappid;

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
      case WebviewRequestMethod.sendTransaction:
        return sendTransaction;
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
    setStatusBarBackgroundColor(id, WalletColor.PRIMARY);
    Application.router.pop(context!);
  }

  static Future<void> signTransaction(String id, String? param) async {
    try {
      final WebviewSignTransaction signTransaction =
          WebviewSignTransaction.fromJson(json.decode(param!));
      final pincodeValidate = await PincodeService.validate(
        signTransaction.token!,
        signTransaction.pincodeDialogStyle,
      );
      if (pincodeValidate == null) {
        return reject(id, '');
      }
      final transactionInfo = signTransaction.transactionInfo;
      final Web3Client web3Client =
          Web3Client(transactionInfo.rpcUrl, Client());
      final DecentralizedIdentity identity =
          Get.find<IdentityStore>().getIdentityById(transactionInfo.accountId)!;
      final DeployedContract contract = DeployedContract(
        ContractAbi.fromJson(
          transactionInfo.contractAbi,
          transactionInfo.contractName,
        ),
        EthereumAddress.fromHex(transactionInfo.contractAddress),
      );

      final rawTx = await web3Client.signTransaction(
        EthPrivateKey.fromHex(identity.accountInfo.priKey),
        Transaction.callContract(
          contract: contract,
          function: contract.function(transactionInfo.functionName),
          parameters:
              transactionInfo.parameters.map((p) => p.realType()).toList(),
          gasPrice: EtherAmount.inWei(transactionInfo.gasPrice),
          maxGas: transactionInfo.maxGas,
        ),
        fetchChainIdFromNetworkId: true,
      );
      resolve(
        id,
        {
          'rawData': '0x${bytesToHex(rawTx)}',
          'token': pincodeValidate is String
              ? pincodeValidate
              : signTransaction.token
        },
      );
    } catch (err) {
      reject(id, err.toString());
    }
  }

  static void sendTransaction(String id, String? param) {
    final SendTransactionRequest sendTransactionRequest =
        SendTransactionRequest.fromJson(json.decode(param!));
    Get.find<ApiProvider>()
        .transferPoint(
      sendTransactionRequest.fromAddress,
      sendTransactionRequest.fromPublicKey,
      sendTransactionRequest.signedTransactionRawData,
    )
        .then((response) {
      resolve(
        id,
        (ApiResponse.fromJson(
          response.data,
          [const FullType(SendTransactionResponse)],
        ).result as SendTransactionResponse)
            .hash,
      );
    }).catchError((err) {
      reject(id, false);
    });
  }

  static Future<void> qrCode(String id, _) async {
    resolve(
      id,
      (await Application.router.navigateTo(context!, Routes.qrScanner)) ?? '',
    );
  }

  static void peekAccount(String id, _) {
    final Tuple3<int, String, String> keyPair =
        Get.find<MnemonicsStore>().peekKeys();
    final DecentralizedIdentity identity = DecentralizedIdentity(
      (builder) => builder
        ..profileInfo.name = id
        ..accountInfo.index = keyPair.first
        ..accountInfo.pubKey = keyPair.second
        ..accountInfo.priKey = keyPair.third,
    );
    resolve(id, identity.basicInfo());
  }

  static void createAccount(String id, String? param) {
    final CreateAccountParam createAccountParam =
        CreateAccountParam.fromJson(json.decode(param!));
    final MnemonicsStore mnemonicsStore = Get.find<MnemonicsStore>();
    mnemonicsStore.generateKeypair(
      (index, keys) => Future.value(
        DecentralizedIdentity(
          (identity) => identity
            ..profileInfo.name =
                DateTime.now().millisecondsSinceEpoch.toString()
            ..accountInfo.pubKey = keys.first
            ..accountInfo.priKey = keys.second
            ..dappId = dappid
            ..extra = createAccountParam.extra
            ..accountInfo.index = index,
        ),
      ).then(
        (identity) =>
            identity.register(mnemonicsStore.credentials).then((success) {
          if (success) {
            resolve(id, identity.basicInfo());
          }
        }),
      ),
    );
  }

  static void getRootKey(String id, _) {
    final MnemonicsStore mnemonicsStore = Get.find<MnemonicsStore>();
    final walletSeed = bip39.mnemonicToSeed(mnemonicsStore.mnemonics);
    resolve(id, sha256.convert(walletSeed).toString());
  }

  static void setStatusBarMode(String id, String? param) {
    if (param == 'dark') {
      return SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  static void setStatusBarBackgroundColor(String id, String? param) {
    if (DeviceInfo.isIOS()) {
      return dappPageStateInstance
          ?.changeBackgroundColor(WalletTheme.rgbColor(param!));
    }
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: WalletTheme.rgbColor(param!),
      ),
    );
  }

  static void getAccounts(String id, _) {
    if (dappid!.isEmpty) {
      resolve(id, null);
    } else {
      resolve(
        id,
        Get.find<IdentityStore>()
            .identitiesWithDapp
            .where((identity) => identity.dappId == dappid)
            .map((identity) => identity.basicInfo())
            .toList(),
      );
    }
  }

  static void getAccountById(String id, String? param) {
    if (param!.isEmpty) {
      return resolve(id, null);
    }

    resolve(id, Get.find<IdentityStore>().getIdentityById(param)?.basicInfo());
  }

  static void getAccountByIds(String id, String? param) {
    if (param!.isEmpty) {
      return resolve(id, []);
    }

    final IdentityStore identityStore = Get.find<IdentityStore>();
    final List<Map> result = [];
    param.split(',').forEach((accountId) {
      final identity = identityStore.getIdentityById(accountId)!;
      result.add({
        'id': identity.id,
        'address': identity.address,
        'publicKey': identity.accountInfo.pubKey,
        'index': identity.accountInfo.index
      });
    });
    resolve(id, result);
  }

  static Future<void> validatePin(String id, String? pin) async {
    final iv = encrypt_tool.IV.fromUtf8('${pin}0123456789');
    final encrypt_tool.Key aesKey =
        encrypt_tool.Key.fromUtf8('${pin}abcdefghijklmnopqrstuvwxyz');
    final encrypt = encrypt_tool.Encrypter(
      encrypt_tool.AES(aesKey, mode: encrypt_tool.AESMode.cbc),
    );
    final SecureStorage secureStorage = Get.find();
    final String? encryptedString =
        await secureStorage.get(SecureStorageItem.masterKey);
    final encrypt_tool.Encrypted encryptedKey =
        encrypt_tool.Encrypted.fromBase64(encryptedString!);
    try {
      encrypt.decrypt(encryptedKey, iv: iv);
      resolve(id, true);
    } catch (error) {
      resolve(id, false);
    }
  }

  static void resolve(String id, dynamic data) {
    webviewController?.runJavascript(
      'window.TWallet.resolvePromise("$id", ${json.encode(json.encode(data))})',
    );
  }

  static void reject(String id, dynamic data) {
    webviewController
        // ignore: avoid_escaping_inner_quotes
        ?.runJavascript(
      'window.TWallet.rejectPromise("$id", ${json.encode(json.encode(data))});',
    );
  }
}

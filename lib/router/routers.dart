import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:tw_wallet_ui/router/router_handler.dart';

class Routes {
  static final String home = "/home";
  static final String inputPin = "/input_pin";
  static final String newWallet = "/new_wallet";
  static final String newIdentity = "/new_identity";
  static final String backupMnemonics = "/backup_mnemonics";
  static final String confirmMnemonics = "/confirm_mnemonics";
  static final String identityDetail = "/identity";
  static final String transferTwPoints = '/transfer_tw_points';
  static final String txList = "/tx_list";
  static final String txListDetails = "/tx_list_details";
  static final String transferConfirm = '/transfer_confirm';
  static final String transferResult = '/transfer_result';
  static final String certificate = '/certificate';
  static final String qrPage = '/identity/qr';
  static final String qrScanner = '/qr_scanner';
  static final String healthCode = '/health_code';
  static final String healthCertPage = '/dapp/health_cert';

  static final Map<String, Handler> routers = {
    home: homeHandler,
    inputPin: inputPinHandler,
    newWallet: newWalletHandler,
    newIdentity: newIdentityHandler,
    backupMnemonics: backupMnemonicsHandler,
    confirmMnemonics: confirmMnemonicsHandler,
    identityDetail: identityDetailHandler,
    transferTwPoints: transferTwPointsHandler,
    txList: txListHandler,
    txListDetails: txListDetailsHandler,
    transferConfirm: transferConfirmHandler,
    transferResult: transferResultHandler,
    certificate: certificateHandler,
    qrPage: qrPageHandler,
    qrScanner: qrScannerHandler,
    healthCode: healthCodeHandler,
    healthCertPage: healthCertificationPageHandler,
  };

  static void configureRoutes(Router router) {
    TransitionType transitionType =
        Platform.isIOS ? TransitionType.cupertino : TransitionType.material;

    routers.forEach(
        (p, h) => router.define(p, handler: h, transitionType: transitionType));
  }
}

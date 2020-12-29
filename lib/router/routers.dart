import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:tw_wallet_ui/router/router_handler.dart';

class Routes {
  static const String home = "/home";
  static const String inputPin = "/input_pin";
  static const String newWallet = "/new_wallet";
  static const String newIdentity = "/new_identity";
  static const String backupMnemonics = "/backup_mnemonics";
  static const String confirmMnemonics = "/confirm_mnemonics";
  static const String restoreMnemonics = "/restore_mnemonics";
  static const String profile = "/profile";
  static const String transferTwPoints = '/transfer_tw_points';
  static const String txList = "/tx_list";
  static const String txListDetails = "/tx_list_details";
  static const String transferConfirm = '/transfer_confirm';
  static const String certificate = '/certificate';
  static const String identityDetail = '/identity';
  static const String qrPage = '/identity/qr';
  static const String qrScanner = '/qr_scanner';
  static const String healthCode = '/health_code';
  static const String healthCertPage = '/dapp/health_cert';
  static const String dapp = '/dapp';
  static const String ownVcPage = '/ssi/vc';
  static const String composeVcPage = '/ssi/compose_vc_page';
  static const String passPage = '/ssi/pass_page';

  static final Map<String, Handler> routers = {
    home: homeHandler,
    inputPin: inputPinHandler,
    newWallet: newWalletHandler,
    newIdentity: newIdentityHandler,
    backupMnemonics: backupMnemonicsHandler,
    confirmMnemonics: confirmMnemonicsHandler,
    restoreMnemonics: restoreMnemonicsHandler,
    profile: profileHandler,
    transferTwPoints: transferTwPointsHandler,
    txList: txListHandler,
    txListDetails: txListDetailsHandler,
    transferConfirm: transferConfirmHandler,
    certificate: certificateHandler,
    qrPage: qrPageHandler,
    qrScanner: qrScannerHandler,
    healthCode: healthCodeHandler,
    healthCertPage: healthCertificationPageHandler,
    identityDetail: identityDetailHandler,
    dapp: dappHandler,
    ownVcPage: ownVcPageHandler,
    composeVcPage: composeVcPageHandler,
    passPage: passPageHandler,
  };

  static void configureRoutes(Router router) {
    final TransitionType transitionType =
        Platform.isIOS ? TransitionType.cupertino : TransitionType.material;

    routers.forEach(
        (p, h) => router.define(p, handler: h, transitionType: transitionType));
  }
}

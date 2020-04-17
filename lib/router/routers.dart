import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:tw_wallet_ui/router/router_handler.dart';

class Routes {
  static String home = "/home";
  static String inputPin = "/input_pin";
  static String newWallet = "/new_wallet";
  static String newIdentity = "/new_identity";
  static String backupMnemonics = "/backup_mnemonics";
  static String confirmMnemonics = "/confirm_mnemonics";
  static String identityDetail = "/identity";
  static String transferTwPoints = '/transfer_tw_points';

  static void configureRoutes(Router router) {
    TransitionType transitionType =
        Platform.isIOS ? TransitionType.cupertino : TransitionType.material;

    router.define(home, handler: homeHandler, transitionType: transitionType);
    router.define(inputPin,
        handler: inputPinHandler, transitionType: transitionType);
    router.define(newWallet,
        handler: newWalletHandler, transitionType: transitionType);
    router.define(newIdentity,
        handler: newIdentityHandler, transitionType: transitionType);
    router.define(backupMnemonics,
        handler: backupMnemonicsHandler, transitionType: transitionType);
    router.define(confirmMnemonics,
        handler: confirmMnemonicsHandler, transitionType: transitionType);
    router.define(identityDetail,
        handler: identityDetailHandler, transitionType: transitionType);
    router.define(transferTwPoints,
        handler: transferTwPointsHandler, transitionType: transitionType);
  }
}

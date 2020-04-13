import 'package:fluro/fluro.dart';
import 'package:tw_wallet_ui/router/router_handler.dart';

class Routes {
  static String home = "home";
  static String inputPin = "input_pin";
  static String newWallet = "new_wallet";
  static String newIdentity = "new_identity";
  static String backupMnemonics = "backup_mnemonics";
  static String confirmMnemonics = "confirm_mnemonics";
  static String identityDetail = "identity";

  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(inputPin, handler: inputPinHandler);
    router.define(newWallet, handler: newWalletHandler);
    router.define(newIdentity, handler: newIdentityHandler);
    router.define(backupMnemonics, handler: backupMnemonicsHandler);
    router.define(confirmMnemonics, handler: confirmMnemonicsHandler);
    router.define(identityDetail, handler: identityDetailHandler);
  }
}

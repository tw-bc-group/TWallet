import 'package:fluro/fluro.dart';

import 'package:tw_wallet_ui/router/routerHandler.dart';

class Routes {
  static String home = "/";
  static String inputPin = "input_pin";
  static String backupMnemonics = "backup_mnemonics";
  static String confirmMnemonics = "confirm_mnemonics";

  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(inputPin, handler: inputPinHandler);
    router.define(backupMnemonics, handler: backupMnemonicsHandler);
    router.define(confirmMnemonics, handler: confirmMnemonicsHandler);
  }
}
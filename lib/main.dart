import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/router/routers.dart';

import 'global/common/application.dart';
import 'global/common/get_it.dart';
import 'global/common/secure_storage.dart';

Future<String> _initialRoute() async {
  bool hasPin = await SecureStorage.get(SecureStorageItem.MasterKey) != null;
  String mnemonics = await SecureStorage.get(SecureStorageItem.Mnemonics);

  return !hasPin
      ? Routes.inputPin
      : mnemonics == null ? Routes.newWallet : Routes.home;
}

Future<void> main() async {
  getItInit(isTest: false);
  runApp(MyApp(initialRoute: await _initialRoute()));
}

class MyApp extends StatelessWidget {
  final initialRoute;

  MyApp({@required this.initialRoute}) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(WalletTheme.rgbColor('#fafafa'));
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return FutureBuilder(
        future: getIt.allReady(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'TW Wallet',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: WalletTheme.rgbColor('#3e71c0'),
                disabledColor: Colors.grey
              ),
              initialRoute: initialRoute,
              onGenerateRoute: Application.router.generator,
            );
          } else {
            return Container(color: WalletTheme.mainBgColor);
          }
        });
  }
}

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/router/routers.dart';

Future<String> _initialRoute() async {
  if (await SecureStorage.hasMnemonics()) {
    return Routes.home;
  } else {
    return Routes.inputPin;
  }
}

Future<void> main() async {
  getItInit(isTest: false);
  runApp(MyApp(initialRoute: await _initialRoute()));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  MyApp({@required this.initialRoute}) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getIt.allReady(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'TW Wallet',
              theme: ThemeData(
                  primaryColor: WalletColor.primary,
                  textTheme: TextTheme(
                      bodyText2: WalletFont.font_14(
                          textStyle: TextStyle(
                              color: WalletColor.primary,
                              fontWeight: FontWeight.w400))),
                  disabledColor: Colors.grey,
                  fontFamily: 'PingFangHK'),
              initialRoute: initialRoute,
              onGenerateRoute: Application.router.generator,
            );
          } else {
            return Container(color: WalletTheme.mainBgColor);
          }
        });
  }
}

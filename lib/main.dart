import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sentry/sentry.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/env_store.dart';

final SentryClient sentry = SentryClient(
    dsn:
        "https://cbc45c2b4f0f400797ca489f4f117699@o402661.ingest.sentry.io/5264109");

void _reportErrorToSentry(Object error, StackTrace stackTrace) {
  sentry.captureException(
    exception: error,
    stackTrace: stackTrace,
  );
}

Future<String> _initialRoute() async {
  await DeviceInfo.initialDeviceInfo();
  if (await SecureStorage.hasMnemonics()) {
    return Routes.home;
  } else {
    return Routes.inputPin;
  }
}

Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    Zone.current.handleUncaughtError(details.exception, details.stack);
  };
  getItInit(isTest: false);
  _initialRoute().then((initialRoute) => runZonedGuarded(
        () => runApp(ThoughtWallet(initialRoute: initialRoute)),
        (error, stackTrace) {
          _reportErrorToSentry(error, stackTrace);
        },
      ));
}

class ThoughtWallet extends StatelessWidget {
  final String initialRoute;

  ThoughtWallet({@required this.initialRoute}) {
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
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: appName(),
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

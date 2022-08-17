import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:sentry/sentry.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/splash_screen/splash_screen.dart';

final SentryClient sentry = SentryClient(
  SentryOptions()
    ..dsn =
        "https://cbc45c2b4f0f400797ca489f4f117699@o402661.ingest.sentry.io/5264109",
);

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

Future<Future<SentryId>> _reportError(dynamic error, dynamic stackTrace) async {
  return sentry.captureException(
    false,
    stackTrace: stackTrace,
  );
}

Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      await _reportError(details.exception, details.stack);
    }
  };

  runApp(
    const SplashScreen(
      onInitializationComplete: runMainApp,
    ),
  );
}

void runMainApp(String initialRoute) {
  runZonedGuarded(
    () => runApp(TWallet(initialRoute: initialRoute)),
    (error, stackTrace) async {
      await _reportError(error, stackTrace);
    },
  );
}

class TWallet extends StatelessWidget {
  final String initialRoute;
  final List<NavigatorObserver> navigatorObservers;

  TWallet({required this.initialRoute, this.navigatorObservers = const []}) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;

    Magic.instance = Magic.custom(
      "pk_live_CCD4C7EF13C55895",
      rpcUrl: 'https://rinkeby.infura.io/v3/f392fa8f8e5448b690169441ea7d43e6',
      chainId: 0x4,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        navigatorObservers: navigatorObservers,
        debugShowCheckedModeBanner: false,
        title: Application.appName,
        theme: ThemeData(
          primaryColor: WalletColor.white,
          textTheme: TextTheme(
            bodyText2: WalletFont.font_14(
              textStyle: TextStyle(
                color: WalletColor.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          disabledColor: Colors.grey,
          fontFamily: 'PingFangHK',
        ),
        initialRoute: initialRoute,
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/master_key.dart';
import 'package:tw_wallet_ui/router/routers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(firstTime: await MasterKey().read() == null));
}

class MyApp extends StatelessWidget {
  final bool firstTime;
  final router = new Router();

  MyApp({@required this.firstTime}) {
    Routes.configureRoutes(router);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TW Wallet',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: firstTime ? '/input_pin' : '/assets',
      onGenerateRoute: router.generator,
    );
  }
}

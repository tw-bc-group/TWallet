import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(first: await SecureStorage().getMasterKey() == null));
}

class MyApp extends StatelessWidget {
  final bool first;

  MyApp({@required this.first}) {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MnemonicsStore>(create: (_) => MnemonicsStore())
      ],
      child: MaterialApp(
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
        initialRoute: first ? '/input_pin' : 'backup_mnemonics',
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}

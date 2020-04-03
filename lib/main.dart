import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(
      first: await SecureStorage().get(SecureStorageItem.MasterKey) == null));
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
      providers: [Provider<MnemonicsStore>(create: (_) => MnemonicsStore())],
      child: MaterialApp(
        title: 'TW Wallet',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: first ? '/input_pin' : '/',
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}

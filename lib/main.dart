import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/master_key.dart';

import 'views/home/home_widget.dart';
import 'views/input_pin/input_pin_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(first: await MasterKey().read() == null));
}

class MyApp extends StatelessWidget {
  const MyApp({@required this.first});
  final bool first;

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
      initialRoute: first ? '/input_pin' : '/',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => HomeWidget();
            break;

          case '/input_pin':
            builder = (BuildContext context) => PinInputWidget();
            break;

          default:
            break;
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

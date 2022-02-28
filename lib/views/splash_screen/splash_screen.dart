import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/device_info.dart';
import 'package:tw_wallet_ui/common/getx.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/router/routers.dart';

class SplashScreen extends StatefulWidget {
  final Function onInitializationComplete;

  const SplashScreen({
    required this.onInitializationComplete,
  });

  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeAsyncDependencies();
  }

  Future<String> _initialRoute() async {
    await DeviceInfo.initialDeviceInfo();
    if (await Get.find<SecureStorage>().hasMnemonics()) {
      return Routes.home;
    } else {
      return Routes.inputPin;
    }
  }

  Future<void> _initializeAsyncDependencies() async {
    Application.appName =
        (await PackageInfo.fromPlatform())?.appName ?? 'test-app';
    await initGlobalDependencies();
    final route = await _initialRoute();
    widget.onInitializationComplete(route);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      backgroundColor: WalletColor.white,
      body: Center(child: Image.asset('assets/images/t-wallet.png')),
    );
  }
}

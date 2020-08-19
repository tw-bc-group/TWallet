import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/dapp_list.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/progress_dialog.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/backup_mnemonics/widgets/tips.dart';
import 'package:tw_wallet_ui/views/ble_test/payer/device_list.dart';
import 'package:tw_wallet_ui/views/ble_test/payee/payee_confirm.dart';

Future<void> _cleanPrivateData(BuildContext context) async {
  final ProgressDialog _dialog = getIt<ProgressDialog>();
  _dialog.show();
  return getIt<IdentityStore>()
      .clear()
      .then((_) => getIt<HealthCertificationStore>().clear())
      .then((_) => SecureStorage.clearAll())
      .then((_) => clearAllDappStorage(FlutterWebviewPlugin()))
      .then((_) => Future.delayed(const Duration(seconds: 1)).then((_) {
            _dialog.dismiss();
            Application.router
                .navigateTo(context, Routes.inputPin, clearStack: true);
          }));
}

Future<void> clearAllDappStorage(
    FlutterWebviewPlugin flutterWebviewPlugin) async {
  // ignore: avoid_function_literals_in_foreach_calls
  dappList.forEach((dapp) async {
    await flutterWebviewPlugin.launch(dapp.url, hidden: true);
    await flutterWebviewPlugin.clearCache();
    await flutterWebviewPlugin.close();
  });
}

class MyPage extends StatelessWidget {
  Widget _buildButton(String text, VoidCallback onTap) {
    final _screenUtil = ScreenUtil();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: _screenUtil.setWidth(15).toDouble()),
        height: _screenUtil.setWidth(90).toDouble(),
        decoration: BoxDecoration(
          color: WalletColor.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0f000000),
              offset: Offset(0, 4),
              blurRadius: 12,
            )
          ],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: _screenUtil.setWidth(20).toDouble()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(text, style: WalletFont.font_18()),
                SvgPicture.asset('assets/icons/right-arrow.svg')
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _screenUtil = ScreenUtil();

    return Column(children: <Widget>[
      Container(
        height: _screenUtil.setHeight(244).toDouble(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover)),
        child: Center(
            child: Text('我的',
                style: WalletFont.font_24(
                    textStyle: TextStyle(
                        color: WalletColor.white, letterSpacing: 1.2)))),
      ),
      Expanded(
          child: Container(
              color: WalletColor.lightGrey,
              child: Padding(
                padding: EdgeInsets.all(_screenUtil.setWidth(24).toDouble()),
                child: ListView(
                  children: <Widget>[
                    _buildButton('测试收款', () => Get.to(PayeeConfirm())),
                    _buildButton('Ble客户端', () => Get.to(DeviceListPage())),
                    _buildButton('清除数据', () => _cleanPrivateData(context)),
                    Padding(
                      padding: EdgeInsets.only(
                          top: _screenUtil.setWidth(5).toDouble()),
                      child: const Tips('将从此设备中删除所有钱包数据且无法恢复，请谨慎操作'),
                    )
                  ],
                ),
              )))
    ]);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/secure_storage.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/router/routers.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: WalletTheme.mainBgColor,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: WalletTheme.flatButton(
                      text: '清除数据',
                      onPressed: () async {
                        await SecureStorage.clearAll().then((_) => Application
                            .router
                            .navigateTo(context, Routes.inputPin,
                                clearStack: true));
                      }))
            ]));
  }
}

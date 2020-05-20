import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';

Future<void> _clearPrivateData() async {
  await getIt<IdentityStore>().clear().then((_) => SecureStorage.clearAll());
}

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
                  child: WalletTheme.button(
                      text: '扫取身份码',
                      onPressed: () {
                        Application.router
                            .navigateTo(context, Routes.qrScanner);
                      })),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: WalletTheme.button(
                      text: '清除数据',
                      onPressed: () async {
                        await _clearPrivateData();
                      }))
            ]));
  }
}

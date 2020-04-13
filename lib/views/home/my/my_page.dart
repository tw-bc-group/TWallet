import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/secure_storage.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/router/routers.dart';

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
                      text: '清除数据',
                      onPressed: () async {
                        await _clearPrivateData().then((_) => Application.router
                            .navigateTo(context, Routes.inputPin,
                                clearStack: true));
                      }))
            ]));
  }
}

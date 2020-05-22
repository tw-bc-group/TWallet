import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';

Future<void> _clearPrivateData(BuildContext context) async {
  return getIt<IdentityStore>()
      .clear()
      .then((_) => SecureStorage.clearAll())
      .then((_) => Future.delayed(Duration(seconds: 1)).then(
          (_) => Application.router.navigateTo(context, Routes.inputPin)));
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
                      text: '调试对话框',
                      onPressed: () async {
                        await hintDialogHelper(context, HintType.success, '你好',
                            subText: '测试');
                      })),
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
                        await _clearPrivateData(context);
                      }))
            ]));
  }
}

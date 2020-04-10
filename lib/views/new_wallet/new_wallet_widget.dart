import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/router/routers.dart';

class NewWalletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: WalletTheme.mainBgColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 3),
              Column(children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  child: WalletTheme.flatButton(
                      text: '创建钱包',
                      onPressed: () {
                        Application.router
                            .navigateTo(context, Routes.backupMnemonics);
                      }),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  child: FlatButton(
                    child:
                        WalletTheme.flatButton(text: '恢复钱包', onPressed: () {}),
                    onPressed: () {},
                  ),
                ),
              ])
            ],
          ),
        ));
  }
}

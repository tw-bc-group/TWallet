import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';
import 'package:tw_wallet_ui/widgets/page_title.dart';

class NewWalletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewCommonLayout(
      backIcon: BackIcon.NONE,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)
          ),
          color: WalletColor.white
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 44),
                child: Text(
                  '您可以',
                  style: WalletFont.font_20(),
                  textAlign: TextAlign.center
                ),
              ),
              GestureDetector(
                onTap: () => Application.router.navigateTo(context, Routes.backupMnemonics),
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  padding: EdgeInsets.symmetric(horizontal: 46, vertical: 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: WalletColor.lightGrey,
                  ),
                  child: Row(
                    children: <Widget>[
                      Image(image: AssetImage('assets/images/new-wallet.png')),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Text(
                          '创建钱包',
                          style: WalletFont.font_24()
                        )
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: null,
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 46, vertical: 70),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: WalletColor.lightGrey,
                  ),
                  child: Row(
                    children: <Widget>[
                      Image(image: AssetImage('assets/images/new-wallet.png')),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Text(
                          '恢复钱包',
                          style: WalletFont.font_24(
                            textStyle: TextStyle(
                              color: WalletColor.grey,
                            )
                          )
                        )
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ),
      ));
  }
}

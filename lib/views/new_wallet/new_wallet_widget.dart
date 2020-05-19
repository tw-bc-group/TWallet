import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/theme/color.dart';
import 'package:tw_wallet_ui/global/common/theme/font.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/new_common_layout.dart';
import 'package:tw_wallet_ui/global/widgets/page_title.dart';
import 'package:tw_wallet_ui/router/routers.dart';

class NewWalletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewCommonLayout(
      backIcon: BackIcon.ARROW,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)
          ),
          color: WalletTheme.rgbColor(WalletColor.white)
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
                    color: WalletTheme.rgbColor(WalletColor.light_grey),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.branding_watermark,
                        color: WalletTheme.rgbColor(WalletColor.primary),
                        size: 40,
                      ),
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
                    color: WalletTheme.rgbColor(WalletColor.light_grey),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.branding_watermark,
                        color: WalletTheme.rgbColor(WalletColor.grey),
                        size: 40,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        child: Text(
                          '恢复钱包',
                          style: WalletFont.font_24(
                            textStyle: TextStyle(
                              color: WalletTheme.rgbColor(WalletColor.grey),
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

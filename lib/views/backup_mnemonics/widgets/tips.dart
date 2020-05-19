import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme/color.dart';
import 'package:tw_wallet_ui/global/common/theme/font.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';

class Tips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: WalletTheme.rgbColor(WalletColor.accent).withOpacity(0.1),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 7),
            child: Icon(
              Icons.info,
              color: WalletTheme.rgbColor(WalletColor.accent),
            ),
          ),
          Text(
            '助记词为账户凭证，为了避免账户被盗，请勿截图',
            style: WalletFont.font_12(
              textStyle: TextStyle(
                color: WalletTheme.rgbColor(WalletColor.accent),
              )
            )
          ),
        ]));
  }
}

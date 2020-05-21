import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';

const double FULL_SCREEN_WIDTH = 1000;

class DialogService {
  static YYDialog dialogInstance;

  static showDialog({String title, Widget icon, Widget body, String btnText, Function onPressed}) {
    dialogInstance = YYDialog().build()
      ..backgroundColor = WalletColor.white
      ..borderRadius = 12.0
      ..width = FULL_SCREEN_WIDTH
      ..margin = EdgeInsets.symmetric(horizontal: 48)
      ..widget(Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              title,
              style: WalletFont.font_18(),
              textAlign: TextAlign.center,
            )
          ),
          Container(
            height: 1,
            color: WalletColor.middleGrey,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                if (icon != null) icon,
                if (body != null) body,
                Container(
                  margin: EdgeInsets.only(top: 34, bottom: 20),
                  child: WalletTheme.button(
                    text: btnText,
                    onPressed: onPressed
                  ),
                )
              ],
            )
          )
        ], 
      ))
      ..animatedFunc = (child, animation) {
        return FadeTransition(
          child: child,
          opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
        );
      }
      ..show();
  }

  static discardDialog() {
    if (dialogInstance != null) {
      dialogInstance.dismiss();
      dialogInstance = null;
    }
  }
}
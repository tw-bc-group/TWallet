import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme/color.dart';
import 'package:tw_wallet_ui/global/common/theme/font.dart';

class WalletTheme {
  static Color get titleBgColor => rgbColor('0xfafafa');
  static Color get mainBgColor => rgbColor('0xf2f2f2');
  static Color get listItemBgColor => rgbColor('0xf6f6f6');

  static Widget button({String text, Function onPressed}) {
    const circular = 8.0;

    return Container(
      child: ButtonTheme(
        height: 45,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circular)),
        child: RaisedButton(
          color: WalletColor.primary,
          disabledColor: WalletColor.middleGrey,
          elevation: 0,
          onPressed: onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22)
          ),
          child: Center(
              child: Text(
            text,
            style: WalletFont.font_16(
              textStyle: TextStyle(
                color: WalletColor.white
              )
            )
          )),
        ),
      ),
    );
  }

  static Color rgbColor(String colorString, {double alpha = 1.0}) {
    String colorStr = colorString;

    if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
      colorStr = '0xff' + colorStr;
    }

    if (colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    }
    if (colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    }

    Color color = Color(int.parse(colorStr));
    int red = color.red;
    int green = color.green;
    int blue = color.blue;

    return Color.fromRGBO(red, green, blue, alpha);
  }
}

import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

enum ButtonType { defaultType, outlineType }

class WalletTheme {
  static Color get titleBgColor => rgbColor('0xfafafa');
  static Color get mainBgColor => rgbColor('0xf2f2f2');
  static Color get listItemBgColor => rgbColor('0xf6f6f6');

  static Widget button(
      {String? text,
      VoidCallback? onPressed,
      ButtonType buttonType = ButtonType.defaultType,
      double height = 45,
      Color? outlineColor}) {
    final RaisedButton raisedButton = RaisedButton(
      color: WalletColor.primary,
      disabledColor: WalletColor.middleGrey,
      elevation: 0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Center(
        child: Text(
          text!,
          style: WalletFont.font_16(
            textStyle: TextStyle(color: WalletColor.white),
          ),
        ),
      ),
    );
    final OutlineButton outlineButton = OutlineButton(
      textColor: outlineColor ?? WalletColor.primary,
      disabledTextColor: WalletColor.middleGrey,
      disabledBorderColor: WalletColor.middleGrey,
      borderSide: BorderSide(color: outlineColor ?? WalletColor.primary),
      highlightedBorderColor: outlineColor ?? WalletColor.primary,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            height: 1.38,
            fontFamily: 'PingFangHK',
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ),
    );
    return ButtonTheme(
      height: height,
      child:
          buttonType == ButtonType.defaultType ? raisedButton : outlineButton,
    );
  }

  static Color rgbColor(String colorString, {double alpha = 1.0}) {
    String colorStr = colorString;

    if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
      colorStr = '0xff$colorStr';
    }

    if (colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    }
    if (colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    }

    final Color color = Color(int.parse(colorStr));
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    return Color.fromRGBO(red, green, blue, alpha);
  }
}

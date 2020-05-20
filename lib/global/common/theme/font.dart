import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme/color.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';

class WalletFont {
  static final FontWeight defaultFontWeight = FontWeight.w600;
  static final double defaultLetterSpacing = 1;
  static final Color defaultTextColor = WalletColor.black;

  static TextStyle defaultFontStyle(TextStyle textStyle) {
    return TextStyle(
      fontWeight: defaultFontWeight,
      letterSpacing: defaultLetterSpacing,
      color: defaultTextColor
    ).merge(textStyle);
  }
  
  static TextStyle font_10({TextStyle textStyle}) {
    return defaultFontStyle(
        TextStyle(
        fontSize: 10,
        height: 1.6,
        fontFamily: 'PingFangHK',
        color: WalletColor.black
      )
    ).merge(textStyle);
  }
  
  static TextStyle font_12({TextStyle textStyle}) {
    return defaultFontStyle(
        TextStyle(
        fontSize: 12,
        height: 1.5,
        fontFamily: 'PingFangHK',
        fontWeight: FontWeight.normal,
        color: WalletColor.black
      )
    ).merge(textStyle);
  }

  static TextStyle font_14({TextStyle textStyle}) {
    return defaultFontStyle(
        TextStyle(
        fontSize: 14,
        height: 1.43,
        fontFamily: 'PingFangHK',
        fontWeight: FontWeight.normal,
        color: WalletColor.black
      )
    ).merge(textStyle);
  }

  static TextStyle font_16({TextStyle textStyle}) {
    return defaultFontStyle(
        TextStyle(
        fontSize: 16,
        height: 1.38,
        fontFamily: 'PingFangHK',
        color: WalletColor.black
      )
    ).merge(textStyle);
  }

  static TextStyle font_18({TextStyle textStyle}) {
    return defaultFontStyle(
        TextStyle(
        fontSize: 18,
        height: 1.33,
        fontFamily: 'PingFangHK',
        color: WalletColor.black
      )
    ).merge(textStyle);
  }

  static TextStyle font_20({TextStyle textStyle}) {
    return defaultFontStyle(
        TextStyle(
        fontSize: 20,
        height: 1.3,
        fontFamily: 'PingFangHK',
        color: WalletColor.black
      )
    ).merge(textStyle);
  }

  static TextStyle font_22({TextStyle textStyle}) {
    return defaultFontStyle(
        TextStyle(
        fontSize: 22,
        height: 1.27,
        fontFamily: 'PingFangHK',
        color: WalletColor.black
      )
    ).merge(textStyle);
  }

  static TextStyle font_24({TextStyle textStyle}) {
    return defaultFontStyle(
      TextStyle(
        fontSize: 24,
        height: 1.25,
        fontFamily: 'PingFangHK',
        color: WalletColor.black
      )
    ).merge(textStyle);
  }
}
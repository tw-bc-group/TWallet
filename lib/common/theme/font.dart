import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class WalletFont {
  static const FontWeight defaultFontWeight = FontWeight.w600;
  static const double defaultLetterSpacing = 1;
  static final Color defaultTextColor = WalletColor.black;

  static TextStyle defaultFontStyle(TextStyle textStyle) {
    return TextStyle(
      fontWeight: defaultFontWeight,
      letterSpacing: defaultLetterSpacing,
      color: defaultTextColor,
    ).merge(textStyle);
  }

  static TextStyle font_10({TextStyle? textStyle}) {
    return defaultFontStyle(
      const TextStyle(
        fontSize: 10,
        height: 1.6,
        fontFamily: 'PingFangHK',
        fontWeight: FontWeight.normal,
      ),
    ).merge(textStyle);
  }

  static TextStyle font_12({TextStyle? textStyle}) {
    return defaultFontStyle(
      const TextStyle(
        fontSize: 12,
        height: 1.5,
        fontFamily: 'PingFangHK',
        fontWeight: FontWeight.normal,
      ),
    ).merge(textStyle);
  }

  static TextStyle font_14({TextStyle? textStyle}) {
    return defaultFontStyle(
      const TextStyle(
        fontSize: 14,
        fontFamily: 'PingFangHK',
        fontWeight: FontWeight.normal,
      ),
    ).merge(textStyle);
  }

  static TextStyle font_16({TextStyle? textStyle}) {
    return defaultFontStyle(
      const TextStyle(
        fontSize: 16,
        height: 1.38,
        fontFamily: 'PingFangHK',
      ),
    ).merge(textStyle);
  }

  static TextStyle font_18({TextStyle? textStyle}) {
    return defaultFontStyle(
      const TextStyle(
        fontSize: 18,
        height: 1.33,
        fontFamily: 'PingFangHK',
      ),
    ).merge(textStyle);
  }

  static TextStyle font_20({TextStyle? textStyle}) {
    return defaultFontStyle(
      const TextStyle(
        fontSize: 20,
        height: 1.3,
        fontFamily: 'PingFangHK',
      ),
    ).merge(textStyle);
  }

  static TextStyle font_22({TextStyle? textStyle}) {
    return defaultFontStyle(
      const TextStyle(
        fontSize: 22,
        height: 1.27,
        fontFamily: 'PingFangHK',
      ),
    ).merge(textStyle);
  }

  static TextStyle font_24({TextStyle? textStyle}) {
    return defaultFontStyle(
      const TextStyle(
        fontSize: 24,
        height: 1.25,
        fontFamily: 'PingFangHK',
      ),
    ).merge(textStyle);
  }
}

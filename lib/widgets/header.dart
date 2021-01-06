import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

class Header extends StatelessWidget {
  final String title;
  final double height;
  final TextStyle textStyle;

  static TextStyle defaultHeadTextStyle =
      WalletFont.font_14(textStyle: const TextStyle(color: Colors.white));

  static double defaultHeadHeight = 70;

  const Header({
    @required this.title,
    this.height,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    {
      return Container(
        height: height ?? defaultHeadHeight,
        color: WalletColor.primary,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Center(
                child: Text(title,
                    textAlign: TextAlign.center,
                    style: textStyle ?? defaultHeadTextStyle))
          ],
        ),
      );
    }
  }
}

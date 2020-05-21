import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';

enum HintType {
  success,
  warning,
  error,
  none,
}

SvgPicture _hintTypeToSvg(HintType type) {
  String asset = 'assets/icons/hint.svg';

  switch (type) {
    case HintType.success:
      asset = 'assets/icons/hint-success.svg';
      break;
    case HintType.warning:
      asset = 'assets/icons/hint-warning.svg';
      break;
    case HintType.error:
      asset = 'assets/icons/hint-error.svg';
      break;
    default:
      break;
  }
  return SvgPicture.asset(asset);
}

Future<void> hintDialog(
    BuildContext context, HintType type, String hintText) async {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;

  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Text(
              '提示',
              textAlign: TextAlign.center,
              style: WalletFont.font_18(
                  textStyle: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
          Divider(color: WalletColor.middleGrey),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: _hintTypeToSvg(type),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: height * 0.04, left: width * 0.02, right: width * 0.02),
            child: Text(hintText,
                textAlign: TextAlign.center,
                style: WalletFont.font_14(
                    textStyle: TextStyle(fontWeight: FontWeight.w600))),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.05, vertical: height * 0.02),
            child: WalletTheme.button(
                text: '知道了',
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
        ]);
      });
}

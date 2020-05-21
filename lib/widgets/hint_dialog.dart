import 'dart:async';

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

Future<void> hintDialogFull(
    BuildContext context, HintType type, String hintText,
    {String title = '',
    String subHintText = '',
    String buttonText = '',
    Duration duration}) async {
  final double width = MediaQuery.of(context).size.width;
  final double height = MediaQuery.of(context).size.height;

  List<Widget> children = [
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
  ];

  if (title.isNotEmpty) {
    children.insertAll(0, [
      Padding(
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        child: Text(
          '提示',
          textAlign: TextAlign.center,
          style: WalletFont.font_18(
              textStyle: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),
      Divider(color: WalletColor.middleGrey)
    ]);
  }

  if (subHintText.isNotEmpty) {
    children.insert(
        4,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02),
          child: Text(subHintText,
              textAlign: TextAlign.center,
              style: WalletFont.font_10(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400, letterSpacing: 0.7))),
        ));
  }

  if (buttonText.isNotEmpty || duration == null) {
    children.add(Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      child: WalletTheme.button(
          text: buttonText.isEmpty ? '知道了' : buttonText,
          onPressed: () {
            Navigator.pop(context);
          }),
    ));
  } else {
    Timer(duration, () => Navigator.pop(context));
  }

  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return SimpleDialog(children: children);
      });
}

Future<void> hintDialog(BuildContext context, HintType type, String hintText,
    {String subHintText = ''}) async {
  return hintDialogFull(context, type, hintText,
      title: '提示', subHintText: subHintText, buttonText: '知道了');
}

Future<void> hintDialogSimple(BuildContext context, HintType type,
    String hintText, Duration duration) async {
  return hintDialogFull(context, type, hintText, duration: duration);
}

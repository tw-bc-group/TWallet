import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
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

SvgPicture _hintTypeToSvg(HintType type, {num width}) {
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
  return SvgPicture.asset(asset, width: width, height: width);
}

Future<void> hintDialogHelper(BuildContext context, HintType type, String text,
    {String subText = ''}) async {
  return hintDialogFull(context, type, text,
      subText: subText, buttonText: '知道了');
}

Future<void> hintDialogFull(
  BuildContext context,
  HintType type,
  String text, {
  String subText = '',
  String buttonText = '',
}) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          HintDialog(text, subText, buttonText, type));
}

class HintDialog extends Dialog {
  final String text;
  final String subText;
  final String buttonText;
  final HintType type;

  const HintDialog(this.text, this.subText, this.buttonText, this.type);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();

    List<Widget> children = [
      Padding(
          padding: EdgeInsets.only(top: screenUtil.setHeight(16)),
          child: Text('提示',
              textAlign: TextAlign.center,
              style: WalletFont.font_18(
                  textStyle: TextStyle(fontWeight: FontWeight.w600)))),
      Padding(
        padding: EdgeInsets.only(top: screenUtil.setHeight(16)),
        child: Divider(color: WalletColor.grey),
      ),
      Padding(
        padding: EdgeInsets.only(top: screenUtil.setHeight(20)),
        child: _hintTypeToSvg(type, width: screenUtil.setWidth(44)),
      ),
      Padding(
        padding: EdgeInsets.only(
            top: screenUtil.setHeight(20),
            left: screenUtil.setHeight(20),
            right: screenUtil.setHeight(20)),
        child: Text(text,
            textAlign: TextAlign.center,
            style: WalletFont.font_14(
                textStyle: TextStyle(fontWeight: FontWeight.w600))),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenUtil.setWidth(20),
            vertical: screenUtil.setHeight(20)),
        child: WalletTheme.button(
            height: screenUtil.setHeight(44).toDouble(),
            text: buttonText.isEmpty ? '知道了' : buttonText,
            onPressed: () {
              Navigator.pop(context);
            }),
      )
    ];

    if (subText.isNotEmpty) {
      children.insert(
          4,
          Padding(
            padding: EdgeInsets.only(
                top: screenUtil.setWidth(20),
                left: screenUtil.setWidth(20),
                right: screenUtil.setWidth(20)),
            child: Text(subText,
                textAlign: TextAlign.center,
                style: WalletFont.font_10(
                    textStyle: TextStyle(
                        color: WalletColor.grey,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.7))),
          ));
    }

    return Material(
      type: MaterialType.transparency,
      child: Center(
          child: Container(
              width: screenUtil.setWidth(280),
              decoration: new BoxDecoration(
                  color: WalletColor.white,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: children))),
    );
  }
}

class HintDialogSample extends Dialog {
  final String text;
  final HintType type;

  const HintDialogSample(this.text, this.type);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Timer(Duration(seconds: 1, milliseconds: 500),
          () => Navigator.pop(context));
    });

    ScreenUtil screenUtil = ScreenUtil();

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: screenUtil.setWidth(160),
          height: screenUtil.setWidth(160),
          decoration: new BoxDecoration(
              color: WalletColor.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Color(0x0f000000),
                    offset: Offset(0, 4),
                    blurRadius: 12,
                    spreadRadius: 0)
              ]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: screenUtil.setHeight(32)),
                    child:
                        _hintTypeToSvg(type, width: screenUtil.setWidth(44))),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenUtil.setHeight(32)),
                    child: Text(text,
                        style: WalletFont.font_14(
                            textStyle: TextStyle(fontWeight: FontWeight.w600))))
              ]),
        ),
      ),
    );
  }
}

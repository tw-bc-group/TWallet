import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';

enum DialogType {
  success,
  warning,
  error,
  network,
  hint,
  none,
}

Optional<SvgPicture> _dialogTypeToSvg(DialogType type, {required num width}) {
  String? asset;

  switch (type) {
    case DialogType.success:
      asset = 'assets/icons/hint-success.svg';
      break;
    case DialogType.warning:
      asset = 'assets/icons/hint-warning.svg';
      break;
    case DialogType.error:
      asset = 'assets/icons/hint-error.svg';
      break;
    case DialogType.network:
      asset = 'assets/icons/hint-network.svg';
      break;
    case DialogType.hint:
      asset = 'assets/icons/hint.svg';
      break;
    default:
      break;
  }

  return Optional.ofNullable(asset).map(
    (asset) => SvgPicture.asset(
      asset,
      width: width.toDouble(),
      height: width.toDouble(),
    ),
  );
}

Future<void> hintDialogHelper(
  BuildContext context,
  DialogType type,
  String text, {
  String title = '',
  String subText = '',
}) async {
  return hintDialogFull(
    context,
    type,
    title,
    text,
    subText: subText,
    buttonText: '知道了',
  );
}

Future<void> hintDialogFull(
  BuildContext context,
  DialogType type,
  String title,
  String text, {
  String subText = '',
  String buttonText = '',
}) async {
  return Get.dialog(HintDialog(title, text, subText, buttonText, type));
}

class HintDialog extends Dialog {
  final String text;
  final String title;
  final String subText;
  final String buttonText;
  final DialogType type;

  const HintDialog(
    this.title,
    this.text,
    this.subText,
    this.buttonText,
    this.type,
  );

  @override
  Widget build(BuildContext context) {
    final ScreenUtil screenUtil = ScreenUtil();

    final List<Widget> children = [
      Padding(
        padding: EdgeInsets.only(top: screenUtil.setHeight(16).toDouble()),
        child: Text(
          title.isEmpty ? '提示' : title,
          textAlign: TextAlign.center,
          style: WalletFont.font_18(
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: screenUtil.setHeight(16).toDouble()),
        child: Divider(color: WalletColor.grey),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: screenUtil.setHeight(20).toDouble(),
          left: screenUtil.setHeight(20).toDouble(),
          right: screenUtil.setHeight(20).toDouble(),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: WalletFont.font_14(
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(20).toDouble(),
          vertical: screenUtil.setHeight(20).toDouble(),
        ),
        child: WalletTheme.button(
          height: screenUtil.setHeight(44).toDouble(),
          text: buttonText.isEmpty ? '知道了' : buttonText,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )
    ];

    _dialogTypeToSvg(type, width: screenUtil.setWidth(44)).ifPresent(
      (svgPicture) => children.insert(
        2,
        Padding(
          padding: EdgeInsets.only(top: screenUtil.setHeight(20).toDouble()),
          child: svgPicture,
        ),
      ),
    );

    if (subText.isNotEmpty) {
      children.insert(
        4,
        Padding(
          padding: EdgeInsets.only(
            top: screenUtil.setWidth(20).toDouble(),
            left: screenUtil.setWidth(20).toDouble(),
            right: screenUtil.setWidth(20).toDouble(),
          ),
          child: Text(
            subText,
            textAlign: TextAlign.center,
            style: WalletFont.font_10(
              textStyle: TextStyle(
                color: WalletColor.grey,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.7,
              ),
            ),
          ),
        ),
      );
    }

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: screenUtil.setWidth(280).toDouble(),
          decoration: BoxDecoration(
            color: WalletColor.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}

Future<void> showDialogSimple(DialogType type, String text) {
  return Get.dialog(HintDialogSample(type, text));
}

class HintDialogSample extends Dialog {
  final String text;
  final DialogType type;

  const HintDialogSample(this.type, this.text);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Timer(
        const Duration(seconds: 1, milliseconds: 500),
        () => Navigator.pop(context),
      );
    });

    final ScreenUtil screenUtil = ScreenUtil();
    final int textVerticalPadding = type == DialogType.none ? 15 : 32;

    final List<Widget> children =
        _dialogTypeToSvg(type, width: screenUtil.setWidth(44))
            .map((svgPicture) {
      return [
        Padding(
          padding: EdgeInsets.only(top: screenUtil.setHeight(32).toDouble()),
          child: svgPicture,
        )
      ];
    }).orElse([]);

    children.add(
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(20).toDouble(),
          vertical: screenUtil.setHeight(textVerticalPadding).toDouble(),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: WalletFont.font_14(
            textStyle: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: screenUtil
              .setWidth(type == DialogType.none ? 120 : 160)
              .toDouble(),
          decoration: BoxDecoration(
            color: WalletColor.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0f000000),
                offset: Offset(0, 4),
                blurRadius: 12,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        ),
      ),
    );
  }
}

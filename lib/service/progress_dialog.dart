import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class ProgressDialog {
  int count = 0;
  YYDialog _dialog;

  void show() {
    count++;

    if (count == 1) {
      _dialog = _showDialog();
    }
  }

  void dismiss() {
    if (count > 0) {
      count--;
    }

    if (count == 0) {
      if (null != _dialog) {
        _dialog.dismiss();
        _dialog = null;
      }
    }
  }

  YYDialog _showDialog() {
    return YYDialog().build(Get.overlayContext)
      ..borderRadius = 12
      ..barrierColor = Colors.transparent
      ..backgroundColor = WalletColor.white
      ..width = 160
      ..height = 160
      ..widget(Container(
        width: 60,
        height: 60,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 50),
        child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(WalletColor.primary)),
      ))
      ..show();
  }
}

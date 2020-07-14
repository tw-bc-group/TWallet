import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/widgets/pin_dialog.dart';

class PincodeService {
  static YYDialog dialogInstance;
  static Completer completer;

  static Future<dynamic> validate() {
    completer = Completer();
    dialogInstance = YYDialog().build()
      ..borderRadius = 12
      ..barrierColor = WalletColor.black.withOpacity(0.5)
      ..backgroundColor = WalletColor.white
      ..margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 144)
      ..width = 1000
      ..widget(
        PinDialogWidget(completer: completer),
      )
      ..dismissCallBack = () {
        if (!completer.isCompleted) {
          completer.complete();
        }
        dialogInstance = null;
      }
      ..show();
    return completer.future.then((value) {
      dialogInstance.dismiss();
      return value;
    });
  }

  static void dismissPincodeDialog() {
    if (dialogInstance != null) {
      dialogInstance.dismiss();
    }
  }
}

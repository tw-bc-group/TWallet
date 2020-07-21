import 'dart:async';

import 'package:corsac_jwt/corsac_jwt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_style.dart';
import 'package:tw_wallet_ui/widgets/pin_dialog.dart';

const tokenSecret = 'tokenSecret';

class PincodeService {
  static YYDialog dialogInstance;
  static Completer completer;

  static Future<dynamic> validate(
    String token,
    WebviewPincodeDialogStyle pincodeDialogStyle,
  ) {
    if (verifyToken(token)) {
      return Future.value(true);
    }
    completer = Completer();
    dialogInstance = YYDialog().build()
      ..borderRadius = 12
      ..barrierColor = WalletColor.black.withOpacity(0.5)
      ..backgroundColor = WalletColor.white
      ..margin = const EdgeInsets.symmetric(horizontal: 24, vertical: 144)
      ..width = 1000
      ..widget(
        PinDialogWidget(
            completer: completer, pincodeDialogStyle: pincodeDialogStyle),
      )
      ..dismissCallBack = () {
        if (!completer.isCompleted) {
          completer.complete();
        }
      }
      ..show();
    return completer.future.then((value) {
      dialogInstance.dismiss();
      dialogInstance = null;
      return value;
    });
  }

  static void dismissPincodeDialog() {
    if (dialogInstance != null) {
      dialogInstance.dismiss();
    }
  }

  static String createToken() {
    final builder = JWTBuilder()
      ..expiresAt = DateTime.now().add(const Duration(minutes: 1))
      ..setClaim('name', 'dapp');
    final signer = JWTHmacSha256Signer(tokenSecret);
    final signedToken = builder.getSignedToken(signer);
    return signedToken.toString();
  }

  static bool verifyToken(String stringToken) {
    final signer = JWTHmacSha256Signer(tokenSecret);
    final decodedToken = JWT.parse(stringToken);

    if (!decodedToken.verify(signer)) {
      return false;
    }

    final validator = JWTValidator();
    final Set<String> errors = validator.validate(decodedToken);
    return errors.isEmpty;
  }
}

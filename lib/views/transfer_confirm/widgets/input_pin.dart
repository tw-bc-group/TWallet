import 'dart:async';

import 'package:encrypt/encrypt.dart' as encrypt_tool;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optional/optional.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_error_msg.dart';
import 'package:tw_wallet_ui/models/webview/pincode_dialog/pincode_dialog_input.dart';
import 'package:tw_wallet_ui/service/pincode.dart';
import 'package:tw_wallet_ui/widgets/error_row.dart';

class InputPinWidget extends StatefulWidget {
  final bool autoValidate;
  final WebviewPincodeDialogInput pincodeDialogInput;
  final WebviewPincodeDialogErrorMsg pincodeDialogErrorMsg;
  final Function onValidateSuccess;
  final Completer completer;

  const InputPinWidget({
    Key key,
    this.autoValidate = false,
    this.pincodeDialogInput,
    this.pincodeDialogErrorMsg,
    this.onValidateSuccess,
    this.completer,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InputPinWidgetState();
  }
}

class InputPinWidgetState extends State<InputPinWidget> {
  String pinValue;
  bool showErrorMsg = false;

  Future<bool> validatePin() async {
    final iv = encrypt_tool.IV.fromUtf8('${pinValue}0123456789');
    final encrypt_tool.Key aesKey =
        encrypt_tool.Key.fromUtf8('${pinValue}abcdefghijklmnopqrstuvwxyz');
    final encrypt = encrypt_tool.Encrypter(
        encrypt_tool.AES(aesKey, mode: encrypt_tool.AESMode.cbc));
    final String encryptedString =
        await SecureStorage.get(SecureStorageItem.masterKey);
    final encrypt_tool.Encrypted encryptedKey =
        encrypt_tool.Encrypted.fromBase64(encryptedString);
    try {
      encrypt.decrypt(encryptedKey, iv: iv);
      if (widget.completer != null) {
        widget.completer.complete(PincodeService.createToken());
      }
      return true;
    } catch (error) {
      setState(() {
        showErrorMsg = true;
      });
      return false;
    }
  }

  void onChanged(String value) {
    if (showErrorMsg) {
      showErrorMsg = false;
    }
    setState(() {
      pinValue = value;
    });
  }

  void handlePinComplete(String pincode) {
    if (!widget.autoValidate) {
      return;
    }
    validatePin();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          child: PinCodeTextField(
              length: 6,
              obsecureText: true,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderWidth: widget.pincodeDialogInput?.borderWidth ?? 1,
                borderRadius: BorderRadius.all(Radius.circular(
                    widget.pincodeDialogInput?.borderRadius ?? 8)),
                fieldHeight: widget.pincodeDialogInput?.size ?? 40,
                fieldWidth: widget.pincodeDialogInput?.size ?? 40,
                inactiveColor: WalletTheme.rgbColor(
                    widget.pincodeDialogInput?.borderColor ??
                        WalletColor.BLACK),
                activeColor: WalletTheme.rgbColor(
                    widget.pincodeDialogInput?.activeBorderColor ??
                        WalletColor.PRIMARY),
                selectedColor: WalletTheme.rgbColor(
                    widget.pincodeDialogInput?.selectedBorderColor ??
                        WalletColor.PRIMARY),
                inactiveFillColor: WalletTheme.rgbColor(
                    widget.pincodeDialogInput?.filledColor ??
                        WalletColor.WHITE),
                activeFillColor: WalletTheme.rgbColor(
                    widget.pincodeDialogInput?.activeFillColor ??
                        WalletColor.WHITE),
                selectedFillColor: WalletTheme.rgbColor(
                    widget.pincodeDialogInput?.selectedFillColor ??
                        WalletColor.PRIMARY),
              ),
              animationDuration: const Duration(milliseconds: 300),
              textStyle: WalletFont.font_16(
                textStyle: TextStyle(
                  color: WalletTheme.rgbColor(
                      widget.pincodeDialogInput?.textColor ??
                          WalletColor.BLACK),
                  fontSize: Optional.ofNullable(widget.pincodeDialogInput)
                      .map((v) => v.textSize)
                      .orElse(16),
                ),
              ),
              enableActiveFill: true,
              textInputType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              onChanged: onChanged,
              onCompleted: handlePinComplete),
        ),
        if (showErrorMsg)
          ErrorRowWidget(
            errorText: 'PIN码错误，请重新输入',
            pincodeDialogErrorMsg: widget.pincodeDialogErrorMsg,
          )
      ],
    );
  }
}

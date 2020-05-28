import 'package:encrypt/encrypt.dart' as encrypt_tool;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/widgets/error_row.dart';

class InputPinWidget extends StatefulWidget {
  const InputPinWidget({Key key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 32),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Text(
                '输入PIN码',
                style: WalletFont.font_16(),
              ),
            ),
            Container(
              width: double.infinity,
              child: PinCodeTextField(
                length: 6,
                obsecureText: true,
                animationType: AnimationType.fade,
                shape: PinCodeFieldShape.box,
                animationDuration: const Duration(milliseconds: 300),
                borderWidth: 1,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                fieldHeight: 40,
                fieldWidth: 40,
                activeColor: WalletColor.primary,
                inactiveColor: WalletColor.black,
                inactiveFillColor: WalletColor.white,
                activeFillColor: WalletColor.white,
                selectedFillColor: WalletColor.primary,
                textStyle: WalletFont.font_16(),
                enableActiveFill: true,
                textInputType: TextInputType.number,
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                onChanged: onChanged,
              ),
            ),
            if (showErrorMsg) const ErrorRowWidget('*PIN码错误，请重新输入')
          ],
        ));
  }
}

import 'package:encrypt/encrypt.dart' as Encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/widgets/error_row.dart';

class InputPinWidget extends StatefulWidget {
  InputPinWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InputPinWidgetState();
  }
}

class InputPinWidgetState extends State<InputPinWidget> {
  String pinValue;
  bool showErrorMsg = false;

  Future<bool> validatePin() async {
    final iv = Encrypt.IV.fromUtf8(pinValue + '0123456789');
    Encrypt.Key aesKey =
        Encrypt.Key.fromUtf8(pinValue + 'abcdefghijklmnopqrstuvwxyz');
    var encrypt =
        Encrypt.Encrypter(Encrypt.AES(aesKey, mode: Encrypt.AESMode.cbc));
    var encryptedString = await SecureStorage.get(SecureStorageItem.MasterKey);
    var encryptedKey = Encrypt.Encrypted.fromBase64(encryptedString);
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

  onChanged(String value) {
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
        margin: EdgeInsets.only(top: 32),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
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
                animationDuration: Duration(milliseconds: 300),
                borderWidth: 1,
                borderRadius: BorderRadius.all(Radius.circular(8)),
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
            if (showErrorMsg) ErrorRowWidget('*PIN码错误，请重新输入')
          ],
        ));
  }
}

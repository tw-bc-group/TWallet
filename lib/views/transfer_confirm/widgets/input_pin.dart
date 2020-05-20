import 'package:encrypt/encrypt.dart' as Encrypt;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';

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
        margin: EdgeInsets.only(top: 66),
        padding: EdgeInsets.symmetric(horizontal: 43),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '请输入PIN码',
              style: TextStyle(
                fontSize: 14,
                color: WalletTheme.rgbColor('#534f4f'),
              ),
              textAlign: TextAlign.left,
            ),
            showErrorMsg
                ? Text(
                    '*PIN码错误，请重新输入',
                    style: TextStyle(
                        fontSize: 10,
                        height: 2,
                        letterSpacing: 2.5,
                        color: WalletTheme.rgbColor('#dd5757')),
                  )
                : Container(),
            PinCodeTextField(
              length: 6,
              obsecureText: true,
              animationType: AnimationType.fade,
              shape: PinCodeFieldShape.box,
              animationDuration: Duration(milliseconds: 300),
              borderWidth: 2.7,
              fieldHeight: 43,
              backgroundColor: WalletTheme.mainBgColor,
              fieldWidth: 43,
              activeColor: WalletTheme.rgbColor('#dddddd'),
              inactiveColor: WalletTheme.rgbColor('#dddddd'),
              inactiveFillColor: Colors.white,
              activeFillColor: Colors.white,
              enableActiveFill: true,
              textInputType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              onChanged: onChanged,
            )
          ],
        ));
  }
}

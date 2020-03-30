import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tw_wallet_ui/util/color.dart';

import 'input_pin.dart';

class PinCodeInputWidget extends StatelessWidget {
  final _inputPin = InputPin();

  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();

  Decoration _nextButtonDecoration(bool isEnabled) {
    Color color = Colors.grey;

    if (isEnabled) {
      color = WalletColor.blue();
    }

    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: color, offset: Offset(1, -2), blurRadius: 5),
          BoxShadow(color: color, offset: Offset(-1, 2), blurRadius: 5)
        ]);
  }

  Widget _inputPinField(
      TextEditingController textEditingController, Function onChanged) {
    return PinCodeTextField(
      length: 6,
      obsecureText: true,
      animationType: AnimationType.fade,
      shape: PinCodeFieldShape.box,
      animationDuration: Duration(milliseconds: 300),
      borderRadius: BorderRadius.circular(5),
      fieldHeight: 50,
      backgroundColor: Colors.grey.shade50,
      fieldWidth: 40,
      inactiveFillColor: Colors.white,
      activeFillColor: Colors.white,
      enableActiveFill: true,
      textInputType: TextInputType.number,
      controller: textEditingController,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.account_balance_wallet,
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Text(
                  "欢迎来到 TW Wallet",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                child: RichText(
                  text: TextSpan(
                      text: "请创建您的 PIN 码",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45.0, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(children: [
                        Icon(Icons.lock_open),
                        SizedBox(width: 10),
                        Text("解锁钱包")
                      ]),
                      Row(children: [
                        Icon(Icons.payment),
                        SizedBox(width: 10),
                        Text("确认交易")
                      ]),
                      Row(children: [
                        Icon(Icons.settings),
                        SizedBox(width: 10),
                        Text("更多设置")
                      ]),
                    ]),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "请输入 6 位 PIN 码",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: _inputPinField(textEditingController1, (value) {
                    _inputPin.updatePin1(value);
                  })),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "请再次输入 6 位 PIN 码",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                  child: _inputPinField(textEditingController2, (value) {
                    _inputPin.updatePin2(value);
                  })),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Observer(
                    builder: (_) => Text(
                          _inputPin.isUnequal ? "* 请输入一致的 PIN 码" : "",
                          style: TextStyle(
                              color: Colors.red.shade300, fontSize: 15),
                        )),
              ),
              SizedBox(
                height: 20,
              ),
              Observer(
                builder: (_) => Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 30),
                  child: ButtonTheme(
                    height: 50,
                    child: FlatButton(
                      disabledColor: Colors.grey,
                      onPressed: _inputPin.isCompleted ? () => {} : null,
                      child: Center(
                          child: Text(
                        "下一步",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  decoration: _nextButtonDecoration(_inputPin.isCompleted),
                ),
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

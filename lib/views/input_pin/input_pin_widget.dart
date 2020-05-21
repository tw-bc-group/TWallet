import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/router/routers.dart';

import 'input_pin_store.dart';

class PinInputWidget extends StatelessWidget {
  final _inputPin = InputPinStore();

  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();

  Widget _inputPinField(
      TextEditingController textEditingController, Function onChanged) {
    return PinCodeTextField(
      activeColor: WalletColor.black,
      inactiveColor: WalletColor.black,
      selectedFillColor: WalletColor.primary,
      borderWidth: 1,
      length: 6,
      obsecureText: true,
      animationType: AnimationType.fade,
      shape: PinCodeFieldShape.box,
      animationDuration: Duration(milliseconds: 300),
      borderRadius: BorderRadius.circular(5),
      fieldHeight: 40,
      fieldWidth: 40,
      inactiveFillColor: Colors.white,
      activeFillColor: Colors.white,
      enableActiveFill: true,
      textInputType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      controller: textEditingController,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: WalletColor.primary,
      bottomNavigationBar: Theme(
        data: Theme.of(context),
        child: Container(
          color: WalletColor.white,
          height: 30
        )
      ),
      body: Theme(
        data: Theme.of(context),
        child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    alignment: Alignment.bottomCenter,
                  )
                ),
                padding:
                    const EdgeInsets.only(top: 94, bottom: 85),
                child: Text(
                  "欢迎来到 TW Wallet",
                  style: WalletFont.font_22(
                    textStyle: TextStyle(
                      color: WalletColor.white
                    )
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                    color: WalletColor.white),
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 34),
                        child: Text(
                          "请创建您的 PIN 码",
                          style: WalletFont.font_18(
                            textStyle: TextStyle(
                              color: WalletColor.black,
                            )
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                          '- 用于 -',
                          style: WalletFont.font_14(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/wallet.png')),
                                    SizedBox(height: 5),
                                    Text(
                                      "解锁钱包",
                                      style: WalletFont.font_14(
                                        textStyle: TextStyle(
                                          color: WalletColor.primary
                                        )
                                      ),
                                    )
                                  ]
                                ),
                                flex: 1
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/transaction.png')),
                                    SizedBox(height: 5),
                                    Text(
                                      "确认交易",
                                      style: WalletFont.font_14(
                                        textStyle: TextStyle(
                                          color: WalletColor.primary
                                        )
                                      ),
                                    )
                                  ]
                                ),
                                flex: 1
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Image(image: AssetImage('assets/images/setting.png')),
                                    SizedBox(height: 5),
                                    Text(
                                      "更多设置",
                                      style: WalletFont.font_14(
                                        textStyle: TextStyle(
                                          color: WalletColor.primary
                                        )
                                      ),
                                    )
                                  ]
                                ),
                                flex: 1
                              ),
                            ]),
                      ),
                      Container(
                        height: 1,
                        margin: EdgeInsets.only(top: 23),
                        color: WalletColor.middleGrey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          "请输入 6 位 PIN 码",
                          style: WalletFont.font_14(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500
                            )
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(top: 10),
                          child: _inputPinField(textEditingController1, (value) {
                            _inputPin.updatePin1(value);
                          })),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          "请再次输入 6 位 PIN 码",
                          style: WalletFont.font_14(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w500
                            )
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                          padding:
                              const EdgeInsets.only(top: 10),
                          child: _inputPinField(textEditingController2, (value) {
                            _inputPin.updatePin2(value);
                          })),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Observer(
                            builder: (_) => Text(
                                  _inputPin.isUnequal ? "* 请输入一致的 PIN 码" : "",
                                  style: TextStyle(
                                      color: Colors.red.shade300, fontSize: 15),
                                )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Observer(
                        builder: (_) => Container(
                          margin: const EdgeInsets.only(top: 16.0),
                          child: WalletTheme.button(
                              text: '下一步',
                              onPressed: _inputPin.isCompleted
                                  ? () async {
                                      await _inputPin.setMasterKey();
                                      Application.router.navigateTo(
                                          context, Routes.newWallet,
                                          clearStack: true);
                                    }
                                  : null),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                )
              ),
            ],
          ),
        )))));
  }
}

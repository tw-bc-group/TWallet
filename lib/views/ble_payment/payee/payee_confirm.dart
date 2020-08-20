import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/views/ble_payment/payee/payee.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class PayeeConfirm extends StatelessWidget {
  final RxString _payeeName = RxString('');
  final RxDouble _payeeAmount = RxDouble(0.0);

  Widget buildInputField({Widget textFieldChild}) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          children: <Widget>[
            Stack(children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: textFieldChild),
                ],
              ),
            ]),
            Container(
              height: 1,
              color: WalletColor.middleGrey,
              margin: const EdgeInsets.only(top: 6),
            ),
          ],
        ));
  }

  InputDecoration buildInputDecoration(
      {String assetIcon, String labelText, String hintText}) {
    return InputDecoration(
      icon: SvgPicture.asset(assetIcon),
      labelText: labelText,
      labelStyle:
          WalletFont.font_14(textStyle: TextStyle(color: WalletColor.grey)),
      hintText: hintText,
      counterText: '',
      border: InputBorder.none,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => CommonLayout(
        title: '测试收款',
        withBottomBtn: true,
        btnText: '开始收款',
        btnOnPressed: _payeeAmount.value > 0.0 && _payeeName.value.isNotEmpty
            ? () => Get.to(
                Payee(name: _payeeName.value, amount: _payeeAmount.value))
            : null,
        child: Container(
            color: WalletColor.white,
            child: Form(
                child: ListView(
              children: <Widget>[
                buildInputField(
                    textFieldChild: TextField(
                        maxLength: 16,
                        keyboardType: TextInputType.text,
                        onChanged: (String value) =>
                            _payeeName.value = value..trim(),
                        decoration: buildInputDecoration(
                          assetIcon: 'assets/icons/name.svg',
                          labelText: '名称*',
                          hintText: '输入名称',
                        ))),
                buildInputField(
                    textFieldChild: TextField(
                        maxLength: 16,
                        keyboardType: TextInputType.number,
                        onChanged: (String value) =>
                            _payeeAmount.value = double.parse(value.trim()),
                        decoration: buildInputDecoration(
                          assetIcon: 'assets/icons/name.svg',
                          labelText: '金额*',
                          hintText: '输入金额',
                        ))),
              ],
            )))));
  }
}

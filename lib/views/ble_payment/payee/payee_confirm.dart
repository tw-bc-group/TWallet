import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/views/ble_payment/payee/payment.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class PayeeConfirm extends StatelessWidget {
  final Rx<int> _payeeAmount = Rx(100);
  final RxString _payeeName = ''.obs;
  final DecentralizedIdentity identity;
  final TextEditingController _amountController = TextEditingController();

  PayeeConfirm(this.identity);

  Widget buildInputField({required Widget textFieldChild}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(child: textFieldChild),
                ],
              ),
            ],
          ),
          Container(
            height: 1,
            color: WalletColor.middleGrey,
            margin: const EdgeInsets.only(top: 6),
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration({
    required String assetIcon,
    required String labelText,
    required String hintText,
  }) =>
      InputDecoration(
        icon: SvgPicture.asset(assetIcon),
        labelText: labelText,
        labelStyle:
            WalletFont.font_14(textStyle: TextStyle(color: WalletColor.grey)),
        hintText: hintText,
        counterText: '',
        border: InputBorder.none,
      );

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CommonLayout(
        title: '收款信息',
        withBottomBtn: true,
        bottomBackColor: WalletColor.white,
        btnText: '开始收款',
        btnOnPressed: _payeeAmount.value > 0.0 && _payeeName.value.isNotEmpty
            ? () => Get.to(
                  PaymentPage(
                    _payeeName.value,
                    identity.address,
                    _payeeAmount.value,
                  ),
                )
            : () => {},
        child: ColoredBox(
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
                    ),
                  ),
                ),
                buildInputField(
                  textFieldChild: TextField(
                    maxLength: 16,
                    readOnly: true,
                    controller: _amountController
                      ..text = _payeeAmount.value.toString(),
                    keyboardType: TextInputType.number,
                    // onChanged: (String value) =>
                    //     _payeeAmount.value = double.parse(value.trim()),
                    decoration: buildInputDecoration(
                      assetIcon: 'assets/icons/name.svg',
                      labelText: '金额*',
                      hintText: '输入金额',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

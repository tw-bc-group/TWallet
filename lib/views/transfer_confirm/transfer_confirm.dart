import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/confirm_row.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/input_pin.dart';

class TransferConfirmPage extends StatefulWidget {
  final String currency;
  final String amount;
  final String toAddress;

  TransferConfirmPage({this.currency, this.amount, this.toAddress});

  @override
  State<StatefulWidget> createState() {
    return TransferConfirmState(currency: currency, amount: double.parse(amount), toAddress: toAddress);
  }
}

class TransferConfirmState extends State<TransferConfirmPage> {
  final String currency;
  final double amount;
  final String toAddress;
  final inputPinWidgetKey = GlobalKey<InputPinWidgetState>();

  TransferConfirmState({this.currency, this.amount, this.toAddress});

  handleConfirm() async {
    var pinValidation = await inputPinWidgetKey.currentState.validatePin();
    if (pinValidation) {
      print('transfer confirm');
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '确认转出',
      withBottomBtn: true,
      btnText: '确认转出',
      btnOnPressed: handleConfirm,
      child: Column(
        children: [
          ConfirmRowWidget(
            title: '金额',
            contentLeft: amount.toStringAsFixed(2),
            contentRight: currency,
          ),
          ConfirmRowWidget(
            title: '接收地址',
            contentLeft: toAddress,
          ),
          InputPinWidget(key: inputPinWidgetKey)
        ]
      ),
    );
  }
}

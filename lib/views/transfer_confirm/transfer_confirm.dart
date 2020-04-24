import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/confirm_row.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/input_pin.dart';
import 'package:tw_wallet_ui/views/tx_list/tx_list_details_page.dart';
import 'package:tw_wallet_ui/views/tx_list/utils/date.dart';

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
  final inputPinWidgetKey = GlobalKey<InputPinWidgetState>();
  final IdentityStore identityStore = getIt<IdentityStore>();
  final String currency;
  final double amount;
  final String toAddress;

  TransferConfirmState({this.currency, this.amount, this.toAddress});

  handleConfirm() async {
    var pinValidation = await inputPinWidgetKey.currentState.validatePin();
    if (pinValidation) {
      var transferSuccess = await identityStore.selectedIdentity.value.transferPoint(toAddress: toAddress, point: BigInt.from(amount) * BigInt.from(10).pow(18));
      if (transferSuccess) {
        // Application.router.navigateTo(context, '${Routes.transferResult}?amount=$amount&toAddress=$toAddress');
        Navigator.pushNamed(context, Routes.home,
        arguments: TxListDetailsPageArgs(
          amount: amount.toStringAsFixed(2),
          time: parseDate(DateTime.now()),
          status: statusNameCN(TxStatus.transferring),
          fromAddress: identityStore.selectedIdentity.value.address,
          toAddress: toAddress,
          fromAddressName: identityStore.myName,
          isExpense: true,
          onPressed: () {
            identityStore.fetchLatestPoint();
            Navigator.popUntil(context, ModalRoute.withName(Routes.txList));
          }
        ));
      }
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

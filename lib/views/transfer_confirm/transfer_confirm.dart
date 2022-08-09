import 'package:decimal/decimal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/confirm_row.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/input_pin.dart';
import 'package:tw_wallet_ui/views/tx_list/tx_list_details_page.dart';
import 'package:tw_wallet_ui/views/tx_list/utils/date.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class TransferConfirmPage extends StatefulWidget {
  final String currency;
  final String amount;
  final String toAddress;

  const TransferConfirmPage({
    required this.currency,
    required this.amount,
    required this.toAddress,
  });

  @override
  State<StatefulWidget> createState() => TransferConfirmState();
}

class TransferConfirmState extends State<TransferConfirmPage> {
  final GlobalKey<InputPinWidgetState> inputPinWidgetKey =
      GlobalKey<InputPinWidgetState>();
  final IdentityStore identityStore = Get.find();

  TransferConfirmState();

  Future<Object?> handleConfirm() async {
    final bool pinValidation =
        await inputPinWidgetKey.currentState!.validatePin();
    if (pinValidation) {
      final bool transferSuccess =
          await identityStore.selectedIdentity!.value.transferPoint(
        toAddress: widget.toAddress,
        amount: Amount(Decimal.parse(widget.amount.toString())),
      );
      if (transferSuccess) {
        // Application.router.navigateTo(context, '${Routes.transferResult}?amount=$amount&toAddress=$toAddress');
        return Navigator.pushNamed(
          context,
          Routes.txListDetails,
          arguments: TxListDetailsPageArgs(
            amount: '${Application.globalEnv.tokenSymbol}${widget.amount}',
            time: parseDate(DateTime.now()),
            status: TxStatus.transferring,
            fromAddress: identityStore.selectedIdentity!.value.address,
            toAddress: widget.toAddress,
            fromAddressName: identityStore.selectedIdentityName,
            isExpense: true,
          ),
        );
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '确认转出',
      withBottomBtn: true,
      btnText: '确认转出',
      btnOnPressed: handleConfirm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ConfirmRowWidget(
              title: '金额',
              contentLeft:
                  '${Application.globalEnv.tokenSymbol}${widget.amount}',
              contentRight: widget.currency,
            ),
            ConfirmRowWidget(
              title: '接收地址',
              contentLeft: widget.toAddress,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InputPinWidget(key: inputPinWidgetKey),
            )
          ],
        ),
      ),
    );
  }
}

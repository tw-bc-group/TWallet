import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/transfer_confirm/widgets/confirm_row.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class TransferResultPage extends StatelessWidget {
  final IdentityStore identityStore = getIt<IdentityStore>();
  final String amount;
  final String toAddress;

  TransferResultPage({this.amount, this.toAddress});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '转账成功',
      withBottomBtn: true,
      btnOnPressed: () {
        identityStore.fetchLatestPoint();
        Navigator.popUntil(context, ModalRoute.withName(Routes.txList));
      },
      childBuilder: (context, constraints) => Column(children: [
        ConfirmRowWidget(
          title: '金额',
          contentLeft: double.parse(amount).toStringAsFixed(2),
        ),
        ConfirmRowWidget(
          title: '发送方',
          contentLeft: identityStore.selectedIdentity.value.address,
        ),
        ConfirmRowWidget(
          title: '接收方',
          contentLeft: toAddress,
        ),
      ]),
    );
  }
}

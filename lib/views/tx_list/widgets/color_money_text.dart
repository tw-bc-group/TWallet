import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';

class ColorMoneyText extends StatelessWidget {
  final Amount amount;
  final TxStatus status;
  final bool isExpense;

  ColorMoneyText({this.amount, this.status, this.isExpense});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: amount.humanReadableWithSign,
          style: WalletFont.font_18(
            textStyle: TextStyle(
              color: _toColor(status)
            )
          )),
    );
  }

  Color _parseSucceededColor(TxStatus s) {
    // expense -> red, or blue
    return isExpense ? WalletColor.accent : WalletColor.blue;
  }

  Color _toColor(TxStatus status) {
    final _statusColorMap = {
      TxStatus.succeeded: _parseSucceededColor(status),
      TxStatus.transferring: Color(0xFF888888),
      TxStatus.failed: Color(0xFF888888),
    };
    return _statusColorMap[status];
  }
}

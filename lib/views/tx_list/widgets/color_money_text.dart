import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';

class ColorMoneyText extends StatelessWidget {
  static const FONT_SIZE = 14.7;

  final Amount amount;
  final TxStatus status;
  final bool isExpense;

  ColorMoneyText({this.amount, this.status, this.isExpense});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: amount.humanReadableWithSign,
          style: TextStyle(color: _toColor(status), fontSize: FONT_SIZE)),
    );
  }

  Color _parseSucceededColor(TxStatus s) {
    // expense -> red, or blue
    return isExpense ? Color(0XFFDD5757) : Color(0XFF3E71C0);
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

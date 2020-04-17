import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';

class ColorMoneyText extends StatelessWidget {
  static const FIXED_DECIMAL = 2;
  static const FONT_SIZE = 14.7;
  static const _statusColorMap = {
    TxStatus.succeeded: Color(0XFF3E71C0),
    TxStatus.transferring: Color(0xFF888888),
    TxStatus.failed: Color(0XFFDD5757),
  };

  final Decimal amount;
  final TxStatus status;

  ColorMoneyText(this.amount, this.status);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: _parseAmount(amount),
          style: TextStyle(color: _toColor(status), fontSize: FONT_SIZE)),
    );
  }

  String _parseAmount(Decimal num) {
    final isNegative = num.isNegative;
    final str = num.toStringAsFixed(FIXED_DECIMAL);
    return isNegative ? str : "+" + str;
  }

  Color _toColor(TxStatus status) => _statusColorMap[status];
}

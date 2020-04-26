import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/views/tx_list/utils/date.dart';

import 'color_money_text.dart';

class TxListItem extends StatelessWidget {
  static final _greyColor = 0xFF888888;

  final String _address;
  final TxStatus _status;
  final Amount _amount;
  final DateTime _dateTime;
  final GestureTapCallback onTap;
  final bool _isExpense;

  TxListItem(this._address, this._status, this._amount, this._dateTime,
      this.onTap, this._isExpense);

  Widget _renderDate() => Text(parseDate(_dateTime),
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 10.7,
          color: Color(_greyColor)));

  Widget _renderAddress() => Text(_address, style: TextStyle(fontSize: 14.7));

  Widget _renderStatus(TxStatus status) =>
      Text(status.toString(), style: TextStyle(color: Color(_greyColor)));

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        title: _renderAddress(),
        subtitle: _renderStatus(_status),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ColorMoneyText(
              amount: _amount,
              status: _status,
              isExpense: _isExpense,
            ),
            _renderDate()
          ],
        ));
  }
}

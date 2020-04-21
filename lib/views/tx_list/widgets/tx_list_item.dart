import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';

import 'color_money_text.dart';

class TxListItem extends StatelessWidget {
  static final _greyColor = 0xFF888888;

  final String _address;
  final TxStatus _status;
  final Decimal _amount;
  final DateTime _dateTime;
  final GestureTapCallback onTap;

  TxListItem(
      this._address, this._status, this._amount, this._dateTime, this.onTap);

  Widget _renderDate() => Text(_parseDate(_dateTime),
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 10.7,
          color: Color(_greyColor)));

  Widget _renderAddress() => Text(_address, style: TextStyle(fontSize: 14.7));

  Widget _renderStatus(TxStatus status) =>
      Text(_parseStatus(status), style: TextStyle(color: Color(_greyColor)));

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        title: _renderAddress(),
        subtitle: _renderStatus(_status),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [ColorMoneyText(_amount, _status), _renderDate()],
        ));
  }

  String _parseStatus(TxStatus status) {
    final s = {
      TxStatus.succeeded: "成功",
      TxStatus.transferring: "处理中",
      TxStatus.failed: "失败",
    }[status];
    return s;
  }

  String _parseDate(DateTime dateTime) {
    return "${dateTime.day.toString()} ${_month(dateTime.month)} ${dateTime.year}";
  }

  String _month(int m) {
    assert(m >= 1 && m <= 12);
    return [
      "Jan.",
      "Feb.",
      "Mar.",
      "Apr.",
      "May",
      "June",
      "July",
      "Aug.",
      "Sept.",
      "Oct.",
      "Nov.",
      "Dec."
    ][m - 1];
  }
}

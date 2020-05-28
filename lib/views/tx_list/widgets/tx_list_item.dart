import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/amount.dart';
import 'package:tw_wallet_ui/models/did.dart';
import 'package:tw_wallet_ui/models/tx_status.dart';
import 'package:tw_wallet_ui/views/tx_list/utils/date.dart';
import 'package:web3dart/credentials.dart';

import 'color_money_text.dart';

enum TxType {
  credit,
  expense,
}

class TxListItem extends StatelessWidget {
  static const _greyColor = 0xFF888888;

  final String _address;
  final TxStatus _status;
  final Amount _amount;
  final DateTime _dateTime;
  final GestureTapCallback _onTap;
  final TxType _txType;

  const TxListItem(this._address, this._status, this._amount, this._dateTime,
      this._onTap, this._txType);

  Widget _renderDate() => Text(parseDate(_dateTime),
      style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 10.7,
          color: Color(_greyColor)));

  Widget _renderAddress() =>
      Text(addressToShorthandDID(_address), style: WalletFont.font_16());

  String addressToShorthandDID(String address) {
    return DID.fromEthAddress(EthereumAddress.fromHex(address)).shorthandValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[_renderDate()],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _renderAddress(),
                ColorMoneyText(
                  amount: _amount,
                  status: _status,
                  isExpense: _txType == TxType.expense,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/views/tx_list/color_money.dart';

class TxListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletTheme.mainBgColor,
      body: Container(child: ColorMoney()),
    );
  }
}

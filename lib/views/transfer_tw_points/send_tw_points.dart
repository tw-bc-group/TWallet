import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';

class SendTwPoints extends StatelessWidget {
  Widget _twPoint() {
    return Center(
      child: Column(children: [
        Text("TW Points"),
        Text('50'),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: WalletTheme.mainBgColor,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            _twPoint(),
          ],),
        ));
  }
}

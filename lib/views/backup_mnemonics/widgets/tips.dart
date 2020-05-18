import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';

class Tips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 16),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 7),
            child: Icon(
              Icons.info,
              color: WalletTheme.rgbColor('#38508C'),
            ),
          ),
          Text(
            '助记词为账户凭证，为了避免账户被盗，请勿截图',
            style: TextStyle(
              fontSize: 14,
              height: 1.43,
              color: WalletTheme.rgbColor('#4a4a4a'),
              fontWeight: FontWeight.w300,
            ),
          ),
        ]));
  }
}

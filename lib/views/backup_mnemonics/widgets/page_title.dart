import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme.dart';

class PageTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      // padding: const EdgeInsets.all(32),
      margin: new EdgeInsets.only(top: 80, left: 30, right: 30),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    '备份助记词',
                    style: new TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: WalletTheme.rgbColor('#38508c'),
                    ),
                  ),
                ),
                new Text(
                  '请用纸笔抄写下方助记词，我们将在下一步验证',
                  style: new TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

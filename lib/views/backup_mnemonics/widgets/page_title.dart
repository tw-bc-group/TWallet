import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final String desc;

  PageTitle({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = new Text(
      '',
      style: new TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: WalletTheme.rgbColor('#38508c'),
      ),
    );
    if (title != null) {
      titleWidget = new Text(
        title,
        style: new TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: WalletTheme.rgbColor('#38508c'),
        ),
      );
    }

    Widget descWidget = new Text(
      '',
      style: new TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
      ),
    );
    if (desc != null) {
      descWidget = new Text(
        desc,
        style: new TextStyle(
          fontSize: 14,
          color: Colors.grey[700],
        ),
      );
    }

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
                  child: titleWidget
                ),
                descWidget
              ],
            ),
          ),
        ],
      ),
    );
  }
}

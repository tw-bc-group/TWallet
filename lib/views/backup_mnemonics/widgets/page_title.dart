import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme.dart';

class PageTitle extends StatelessWidget {
  final String title;
  final String desc;

  PageTitle({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    Widget titleWidget = Text(
      '',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: WalletTheme.rgbColor('#38508c'),
      ),
    );
    if (title != null) {
      titleWidget = Text(
        title,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: WalletTheme.rgbColor('#38508c'),
        ),
      );
    }

    Widget descWidget = Text(
      '',
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[700],
      ),
    );
    if (desc != null) {
      descWidget = Text(
        desc,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[700],
        ),
      );
    }

    return Container(
      // padding: const EdgeInsets.all(32),
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: titleWidget),
                descWidget
              ],
            ),
          ),
        ],
      ),
    );
  }
}

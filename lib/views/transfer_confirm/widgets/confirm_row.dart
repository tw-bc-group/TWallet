import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';

class ConfirmRowWidget extends StatelessWidget {
  final String title;
  final String contentLeft;
  final String contentRight;

  ConfirmRowWidget({this.title, this.contentLeft, this.contentRight});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.only(top: 5, left: 32, right: 32, bottom: 30),
        decoration:
            BoxDecoration(color: WalletTheme.rgbColor('#fafafa'), boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              offset: Offset(0, 13),
              blurRadius: 13.0)
        ]),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 10, color: WalletTheme.rgbColor('#aaaaaa')),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(contentLeft,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: WalletTheme.rgbColor('#888888')))),
                      contentRight != null
                          ? Text(contentRight,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: WalletTheme.rgbColor('#222222')))
                          : Container()
                    ]))
          ],
        ));
  }
}

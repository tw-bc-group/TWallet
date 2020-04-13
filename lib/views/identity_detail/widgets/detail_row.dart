import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';

class DetailRowWidget extends StatelessWidget {
  final String name;
  final dynamic value;

  DetailRowWidget({this.name, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 28),
      height: 54,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          name == null ? Container() : Text(
            name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
            ),
          ),
          Container(
            width: 200,
            child: Align(
              alignment: Alignment.centerRight,
              child: value is Widget ? value : Text(
                value,
                style: TextStyle(
                  color: WalletTheme.rgbColor('#888888')
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';

class ProfileRowWidget extends StatelessWidget {
  final String name;
  final dynamic value;

  ProfileRowWidget({this.name, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          name == null
              ? Container()
              : Text(
                  name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
          value == null
              ? Container()
              : Container(
                  width: 200,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: value is Widget
                        ? value
                        : Text(
                            value,
                            style: TextStyle(
                                color: WalletTheme.rgbColor('#888888')),
                          ),
                  ),
                )
        ],
      ),
    );
  }
}

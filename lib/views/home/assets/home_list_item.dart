import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class HomeListItem extends StatelessWidget {
  final Widget leading;
  final Widget trailing;

  const HomeListItem({@required this.leading, @required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: WalletColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Color(0x0f000000),
              offset: Offset(0, 4),
              blurRadius: 12,
              spreadRadius: 0)
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              leading,
              trailing,
            ],
          )
        ],
      ),
    );
  }
}

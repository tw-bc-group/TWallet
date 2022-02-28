import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class HomeListItem extends StatelessWidget {
  final Widget leading;
  final Widget trailing;

  const HomeListItem({required this.leading, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WalletColor.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0f000000),
            offset: Offset(0, 4),
            blurRadius: 12,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      margin: const EdgeInsets.only(bottom: 20),
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

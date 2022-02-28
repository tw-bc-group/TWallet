import 'package:flutter/cupertino.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';

import 'header.dart';

class CardGroup extends StatelessWidget {
  const CardGroup({
    required this.name,
    this.children = const <Widget>[],
  });

  final String name;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          Row(
            children: [
              Header(
                title: name,
                height: 50,
                bgColor: WalletColor.white,
                textStyle: WalletFont.font_14(),
              )
            ],
          ),
          Column(children: children)
        ],
      ),
    );
  }
}

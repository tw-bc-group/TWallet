import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme/color.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';

class WordButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  WordButton({@required this.text, @required this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return WordButtonState(text: text, onPressed: onPressed);
  }
}

class WordButtonState extends State<WordButton> {
  final String text;
  final Function onPressed;
  var selected = false;
  final defaultBackColor = WalletColor.white;
  final selectedBackColor = WalletColor.primary;
  final defaultFontColor = WalletColor.primary;
  final selectedFontColor = WalletColor.white;

  WordButtonState({this.text, this.onPressed});

  select() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onPressed();
          select();
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 12),
            margin: EdgeInsets.only(top: 10, right: 12),
            decoration: BoxDecoration(
              color: selected ? selectedBackColor : defaultBackColor,
              borderRadius: BorderRadius.all(
                const Radius.circular(22),
              ),
              border: Border.all(color: WalletColor.primary.withOpacity(0.15))
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: selected ? selectedFontColor : defaultFontColor,
              ),
            )));
  }
}

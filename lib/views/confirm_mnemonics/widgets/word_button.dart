import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class WordButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  const WordButton({@required this.text, @required this.onPressed});

  @override
  State<StatefulWidget> createState() => WordButtonState();
}

class WordButtonState extends State<WordButton> {
  bool selected = false;
  final Color defaultBackColor = WalletColor.white;
  final Color selectedBackColor = WalletColor.primary;
  final Color defaultFontColor = WalletColor.primary;
  final Color selectedFontColor = WalletColor.white;

  WordButtonState();

  void select() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          widget.onPressed();
          select();
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
            margin: const EdgeInsets.only(top: 10, right: 12),
            decoration: BoxDecoration(
                color: selected ? selectedBackColor : defaultBackColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(22),
                ),
                border:
                    Border.all(color: WalletColor.primary.withOpacity(0.15))),
            child: Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                color: selected ? selectedFontColor : defaultFontColor,
              ),
            )));
  }
}

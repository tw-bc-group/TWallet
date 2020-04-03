import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme.dart';

class WordButton extends StatefulWidget {
  final String text;
  final Function onPressed;

  WordButton({this.text, this.onPressed});

  @override
  State<StatefulWidget> createState() {
    return new WordButtonState(text: text, onPressed: onPressed);
  }
}

class WordButtonState extends State<WordButton> {
  final String text;
  final Function onPressed;
  var selected = false;
  final defaultBackColor = WalletTheme.rgbColor('#f6f8f9');
  final selectedBackColor = WalletTheme.rgbColor('#38508c');
  final defaultFontColor = WalletTheme.rgbColor('#38508c');
  final selectedFontColor = WalletTheme.rgbColor('#ffffff');

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
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: EdgeInsets.only(top: 10, right: 16),
            decoration: BoxDecoration(
              color: selected ? selectedBackColor : defaultBackColor,
              borderRadius: new BorderRadius.all(
                const Radius.circular(17),
              ),
            ),
            child: Text(
              text,
              style: new TextStyle(
                fontSize: 14,
                color: selected ? selectedFontColor : defaultFontColor,
              ),
            )));
  }
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
  //     padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 16),
  //     child: Text(
  //       text,
  //       style: TextStyle(
  //       color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
  //     ),
  //     // child: FlatButton(
  //       // disabledColor: Colors.grey,
  //       // onPressed: onPressed,
  //       // child: Center(
  //       //   ,
  //     // decoration: WalletTheme.buttonDecoration(isEnabled: true),
  //   // )
  //   );
  // }
}

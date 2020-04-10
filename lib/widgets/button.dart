import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final Function onPressed;
  final double width;
  final double height;

  Button({this.text, this.onPressed, this.width, this.height});

  @override
  State<StatefulWidget> createState() {
    return ButtonBase(
        text: text, onPressed: onPressed, width: width, height: height);
  }
}

class ButtonBase extends State<Button> {
  String text;
  Function onPressed;
  double width;
  double height;

  ButtonBase({this.text, this.onPressed, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    print(onPressed);
    if (width != null) {
      return Center(
          child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                disabledColor: Theme.of(context).disabledColor,
                onPressed: onPressed,
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              )));
    }
    return Container(
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: FlatButton(
          disabledColor: Theme.of(context).disabledColor,
          onPressed: onPressed,
          child: Center(
              child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ));
  }
}

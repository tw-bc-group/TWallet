import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const Button({this.text, this.onPressed, this.width, this.height});

  @override
  State<StatefulWidget> createState() => ButtonBase();
}

class ButtonBase extends State<Button> {
  ButtonBase();

  @override
  Widget build(BuildContext context) {
    if (widget.width != null) {
      return Center(
          child: Container(
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: FlatButton(
                disabledColor: Theme.of(context).disabledColor,
                onPressed: widget.onPressed,
                child: Center(
                    child: Text(
                  widget.text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
              )));
    }
    return Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: FlatButton(
          disabledColor: Theme.of(context).disabledColor,
          onPressed: widget.onPressed,
          child: Center(
              child: Text(
            widget.text,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          )),
        ));
  }
}

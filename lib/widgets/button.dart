import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const Button({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
  });

  @override
  State<StatefulWidget> createState() => ButtonBase();
}

class ButtonBase extends State<Button> {
  ButtonBase();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black87,
            minimumSize: const Size(88, 36),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
          ).copyWith(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return Theme.of(context).disabledColor;
              }
              return null;
            }),
          ),
          onPressed: widget.onPressed,
          child: Center(
            child: Text(
              widget.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

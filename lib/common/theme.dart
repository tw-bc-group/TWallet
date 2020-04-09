import 'package:flutter/material.dart';

class WalletTheme {
  static Color get titleBgColor => rgbColor('0xfafafa');
  static Color get mainBgColor => rgbColor('0xf2f2f2');

  static Decoration buttonDecoration({bool isEnabled = false}) {
    Color color = Colors.grey;

    if (isEnabled) {
      color = Colors.blue;
    }

    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: color, offset: Offset(1, -2), blurRadius: 5),
          BoxShadow(color: color, offset: Offset(-1, 2), blurRadius: 5)
        ]);
  }

  static Widget flatButton(
      {String text, Function onPressed, double height: 50}) {
    return ButtonTheme(
      height: height,
      child: FlatButton(
        disabledColor: Colors.grey,
        onPressed: onPressed,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  static Color rgbColor(String colorString, {double alpha = 1.0}) {
    String colorStr = colorString;

    if (!colorStr.startsWith('0xff') && colorStr.length == 6) {
      colorStr = '0xff' + colorStr;
    }

    if (colorStr.startsWith('0x') && colorStr.length == 8) {
      colorStr = colorStr.replaceRange(0, 2, '0xff');
    }
    if (colorStr.startsWith('#') && colorStr.length == 7) {
      colorStr = colorStr.replaceRange(0, 1, '0xff');
    }

    Color color = Color(int.parse(colorStr));
    int red = color.red;
    int green = color.green;
    int blue = color.blue;

    return Color.fromRGBO(red, green, blue, alpha);
  }
}

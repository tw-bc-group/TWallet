import 'package:flutter/material.dart';

AppBar baseAppBar({String title, Widget bottom}) {
  return AppBar(
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    title: Text(title, style: TextStyle(color: Colors.black)),
    brightness: Brightness.light,
    backgroundColor: Colors.white,
    bottom: bottom,
  );
}

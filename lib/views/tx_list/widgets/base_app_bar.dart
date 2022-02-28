import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar baseAppBar(
    {required String title, required PreferredSizeWidget bottom}) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    title: Text(title, style: const TextStyle(color: Colors.black)),
    backgroundColor: Colors.white,
    bottom: bottom,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}

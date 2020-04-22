import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget toolBarPanel(
    {final String balance, final Widget trailing, final Widget leading}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: _buildContainer(balance, leading, trailing));
}

Container _buildContainer(String balance, Widget leading, Widget trailing) {
  final column = Column(
    children: <Widget>[
      Center(child: _buildCenterText(balance)),
      Container(
          padding: EdgeInsets.only(bottom: 4, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[leading, trailing],
          ))
    ],
  );

  return Container(child: column);
}

Text _buildCenterText(String balance) {
  return Text(balance,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.7));
}

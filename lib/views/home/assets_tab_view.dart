import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

FutureBuilder<TwPoint> assetsTabViewWidget(
    {Dio dio, String address, String point}) {
  return FutureBuilder<TwPoint>(
      future: fetchPoint(dio: dio, address: address),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container();
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        }
        return Center(child: CircularProgressIndicator());
      });
}

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

Widget _pointItem({@required String point}) {
  return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
          padding: EdgeInsets.all(10),
          child: Row(children: <Widget>[
            Text('TW Points'),
            Expanded(child: Container()),
            Text(point),
          ])));
}

FutureBuilder<TwPoint> pointTabViewWidget(
    {Dio dio, String address, String point}) {
  return FutureBuilder<TwPoint>(
      future: fetchPoint(dio: dio, address: address),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return RefreshIndicator(
              onRefresh: () => fetchPoint(dio: dio, address: address),
              child: Container(
                padding: EdgeInsets.all(18),
                child: ListView(children: <Widget>[
                  _pointItem(point: snapshot.data.strValue)
                ]),
              ));
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        return Center(child: CircularProgressIndicator());
      });
}

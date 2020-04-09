import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

import 'assets_store.dart';

Widget _pointItem({@required String point}) {
  return Container(
      height: 80,
      decoration: BoxDecoration(
        color: WalletTheme.listItemBgColor,
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

class PointTab extends StatelessWidget {
  const PointTab({this.store});
  final AssetsStore store;

  Future _refresh() => store.fetchLatestPoint();

  @override
  // ignore: missing_return
  Widget build(BuildContext context) => Observer(builder: (_) {
        final future = store.latestPointFuture;

        switch (future.status) {
          case FutureStatus.pending:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator(), Text('加载积分...')],
            );
          case FutureStatus.rejected:
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '加载积分失败',
                    style: TextStyle(color: Colors.red),
                  ),
                  RaisedButton(
                    child: const Text('点击重试'),
                    onPressed: _refresh,
                  )
                ]);
          case FutureStatus.fulfilled:
            final TwPoint point = future.result;
            return RefreshIndicator(
              onRefresh: _refresh,
              child: Container(
                padding: EdgeInsets.all(18),
                child: ListView(
                    children: <Widget>[_pointItem(point: point.strValue)]),
              ),
            );
        }
      });
}

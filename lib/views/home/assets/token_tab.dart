import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'assets_store.dart';

class TokenTab extends StatelessWidget {
  const TokenTab({this.store});

  final AssetsStore store;

  void _refresh() => store.fetchLatestPoint();

  @override
  // ignore: missing_return
  Widget build(BuildContext context) => Observer(builder: (_) {
        final future = store.latestPointFuture;
        // TODO: implement build
        switch (future.status) {
          case FutureStatus.pending:
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator(), Text('加载资产...')],
            );
          case FutureStatus.rejected:
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '加载资产失败',
                    style: TextStyle(color: Colors.red),
                  ),
                  RaisedButton(
                    child: const Text('点击重试'),
                    onPressed: _refresh,
                  )
                ]);
          case FutureStatus.fulfilled:
            return Container();
        }
      });
}

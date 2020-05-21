import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/models/tw_balance.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/env_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';

import 'home_list_item.dart';
import 'home_list_view.dart';

Widget _pointItem({@required String point, BuildContext context}) {
  return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.txList),
      child: HomeListItem(
        leading: Text(
          globalEnv().tokenName,
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: Color(0xff111111),
            fontSize: 16,
            fontWeight: FontWeight.w800,
            fontStyle: FontStyle.normal,
            letterSpacing: 0,
          ),
        ),
        trailing: Text(
          point,
          style: TextStyle(
            fontFamily: 'PingFangSC',
            color: Color(0xff4200d4),
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.normal,
            letterSpacing: 0,
          ),
        ),
      ));
}

class PointTab extends StatelessWidget {
  final IdentityStore _store = getIt<IdentityStore>();

  Future<void> _refresh() async {
    _store.fetchLatestPoint();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) => Observer(builder: (_) {
        final ObservableFuture<TwBalance> future =
            _store.fetchBalanceFutureStream.value;

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
            TwBalance balance = future.result;
            return balance == null
                ? Container()
                : HomeListView(
                    onRefresh: _refresh,
                    children: [
                      _pointItem(
                          point: balance.amount.humanReadableWithSymbol,
                          context: context)
                    ],
                  );
        }
      });
}

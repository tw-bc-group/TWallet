import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/common/theme.dart';
import 'package:tw_wallet_ui/views/home/assets/point_tab_view.dart';
import 'package:tw_wallet_ui/views/home/assets/token_tab_view.dart';

import 'assets_store.dart';

class AssetsPageWidget extends StatefulWidget {
  const AssetsPageWidget({this.store});

  final AssetsStore store;

  @override
  State<StatefulWidget> createState() => _AssetsPageWidgetState(store: store);
}

class _AssetsPageWidgetState extends State<AssetsPageWidget>
    with SingleTickerProviderStateMixin {
  _AssetsPageWidgetState({this.store});

  final AssetsStore store;
  final Map<AssetsType, String> _tabs = {
    AssetsType.point: '积分',
    AssetsType.token: '资产'
  };

  TabController _tabController;

  void _onTabChange() {
    store.loadAssets(_tabs.keys.toList()[_tabController.index]);
  }

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this)
      ..addListener(_onTabChange);
    store.loadAssets(_tabs.keys.first);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: WalletTheme.rgbColor('fafafa'),
        child: Column(children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
            ),
            SizedBox(width: 10),
            Observer(builder: (_) {
              final future = store.currentIdentity;
              return Text(future.status == FutureStatus.fulfilled
                  ? future.result.name
                  : '');
            }),
            Expanded(child: Container()),
          ]),
          TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              tabs: _tabs.values.map((t) => Tab(text: t)).toList()),
          Expanded(
              child: Container(
                  color: WalletTheme.bgColor(),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      PointTabView(store: store),
                      TokenTabView(store: store)
                    ],
                  ))),
        ]));
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: WalletTheme.bgColor(),
//      appBar: AppBar(
//        leading: Container(
//            padding: EdgeInsets.all(10),
//            child: CircleAvatar(
//              backgroundImage: AssetImage('assets/images/avatar.jpg'),
//            )),
//        title: Observer(builder: (_) {
//          final future = store.currentIdentity;
//          return Text(future.status == FutureStatus.fulfilled
//              ? future.result.name
//              : '');
//        }),
//        bottom: TabBar(
//            controller: _tabController,
//            tabs: _tabs.values.map((t) => Tab(text: t)).toList()),
//      ),
//      body: SafeArea(
//          child: TabBarView(
//        controller: _tabController,
//        children: [PointTabView(store: store), TokenTabView(store: store)],
//      )),
//    );
//  }
}

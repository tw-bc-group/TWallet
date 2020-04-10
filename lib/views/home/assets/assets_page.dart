import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/views/home/assets/point_tab.dart';
import 'package:tw_wallet_ui/views/home/assets/token_tab.dart';
import 'package:tw_wallet_ui/widgets/button.dart';

import '../home.dart';
import 'assets_store.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({this.store});

  final AssetsStore store;

  @override
  State<StatefulWidget> createState() => _AssetsPageState(store: store);
}

class _AssetsPageState extends State<AssetsPage>
    with SingleTickerProviderStateMixin {
  _AssetsPageState({this.store});

  final AssetsStore store;
  final Map<AssetsType, String> _tabs = {
    AssetsType.point: '积分',
    AssetsType.token: '资产'
  };

  TabController _tabController;

  void _onTabChange() {
    // store.loadAssets(_tabs.keys.toList()[_tabController.index]);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this)
      ..addListener(_onTabChange);
    // store.loadAssets(_tabs.keys.first);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => new SimpleDialog(
          contentPadding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
          children: <Widget>[
            Center(
                child: Text(
              '您还没有添加身份，请前往\"身份\"页面添加身份',
              style: TextStyle(
                fontSize: 15,
                height: 1.82,
              ),
              textAlign: TextAlign.center,
            )),
            Container(
                margin: EdgeInsets.only(top: 48),
                child: Button(
                  width: 100,
                  height: 40,
                  text: '确定',
                  onPressed: () {
                    Application.router.navigateTo(
                        context, '/home?index=${HomeState.identityIndex}',
                        replace: true,
                        transition: TransitionType.fadeIn,
                        transitionDuration: Duration(milliseconds: 1));
                  },
                ))
          ],
        ),
      );
    });
  }

  Widget buildHeader() {
    if (store.currentIdentity == null) {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Expanded(child: Container()),
        PopupMenuButton(
          icon: Icon(Icons.apps),
          itemBuilder: (BuildContext context) {
            return [PopupMenuItem(child: Text('老钱'))];
          },
        ),
      ]);
    }

    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Container(
        padding: EdgeInsets.all(15),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpg'),
        ),
      ),
      SizedBox(width: 10),
      Observer(builder: (_) {
        final future = store.currentIdentity;
        return Text(
            future.status == FutureStatus.fulfilled ? future.result.name : '');
      }),
      Expanded(child: Container()),
      PopupMenuButton(
        icon: Icon(Icons.apps),
        itemBuilder: (BuildContext context) {
          return [PopupMenuItem(child: Text('老钱'))];
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: WalletTheme.titleBgColor,
        child: Column(children: <Widget>[
          buildHeader(),
          TabBar(
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              controller: _tabController,
              tabs: _tabs.values.map((t) => Tab(text: t)).toList()),
          Expanded(
              child: Container(
                  color: WalletTheme.mainBgColor,
                  child: TabBarView(
                    controller: _tabController,
                    children: [PointTab(store: store), TokenTab(store: store)],
                  ))),
        ]));
  }
}

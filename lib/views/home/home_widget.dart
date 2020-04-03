import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/env.dart';
import 'package:tw_wallet_ui/common/theme.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/views/home/point_tab_view.dart';

import 'assets_tab_view.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({this.identity});

  final Identity identity;

  @override
  HomeWidgetState createState() => HomeWidgetState(identity: identity);
}

class HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  HomeWidgetState({this.identity});

  final Identity identity;
  final List<String> _tabs = ['分数', '资产'];

  Dio _dio;
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _dio = Dio()
      ..options.baseUrl = API_GATEWAY_BASE_URL
      ..options.connectTimeout = API_GATEWAY_CONNECT_TIMEOUT;

    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  Widget _tabView(String tabName) {
    Widget _view;
    switch (tabName) {
      case '分数':
        _view = pointTabViewWidget(dio: _dio, address: identity.address);
        break;

      case '资产':
        _view = assetsTabViewWidget(dio: _dio, address: identity.address);
        break;

      default:
        assert(true);
        break;
    }
    return _view;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletTheme.bgColor(),
      appBar: AppBar(
        leading: Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpg'),
            )),
        title: Text(identity.name),
        bottom: TabBar(
            controller: _tabController,
            tabs: _tabs.map((t) => Tab(text: t)).toList()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((t) => _tabView(t)).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Row(children: <Widget>[
        IconButton(icon: Icon(Icons.home), onPressed: () {}),
        IconButton(icon: Icon(Icons.more), onPressed: () {}),
        IconButton(icon: Icon(Icons.business), onPressed: () {}),
        IconButton(icon: Icon(Icons.account_box), onPressed: () {}),
      ], mainAxisAlignment: MainAxisAlignment.spaceAround)),
    );
  }
}

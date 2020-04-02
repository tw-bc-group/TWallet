import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/env.dart';
import 'package:tw_wallet_ui/common/theme.dart';
import 'package:tw_wallet_ui/models/tw_point.dart';

class AssetsWidget extends StatefulWidget {
  AssetsWidget({@required this.name, @required this.address});

  final String name;
  final String address;

  @override
  AssetsWidgetState createState() =>
      AssetsWidgetState(name: name, address: address);
}

class AssetsWidgetState extends State<AssetsWidget>
    with SingleTickerProviderStateMixin {
  AssetsWidgetState({this.name, this.address});

  final String name;
  final String address;
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

  Widget _pointItem() {
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
              Text('50.00'),
            ])));
  }

  FutureBuilder<TwPoint> _pointView() {
    return FutureBuilder<TwPoint>(
        future: fetchPoint(dio: _dio, address: address),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(18),
              child: ListView(children: <Widget>[_pointItem()]),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _assetsView() {
    return Container();
  }

  Widget _tabView(String tabName) {
    Widget _view;
    switch (tabName) {
      case '分数':
        _view = _pointView();
        break;

      case '资产':
        _view = _assetsView();
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
        title: Text(name),
        bottom: TabBar(
            controller: _tabController,
            tabs: _tabs.map((t) => Tab(text: t)).toList()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((index) => _tabView(index)).toList(),
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

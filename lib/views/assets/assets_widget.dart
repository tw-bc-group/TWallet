import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme.dart';

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

  TabController _tabController;

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

  Widget _pointView() {
    return Container(
      padding: EdgeInsets.all(18),
      child: ListView(children: <Widget>[_pointItem()]),
    );
  }

  Widget _assetsView() {
    return Container();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
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
        children: _tabs.asMap().keys.map((k) {
          Widget _view;
          switch (k) {
            case 0:
              _view = _pointView();
              break;

            case 1:
              _view = _assetsView();
              break;

            default:
              assert(true);
              break;
          }
          return _view;
        }).toList(),
      ),
    );
  }
}

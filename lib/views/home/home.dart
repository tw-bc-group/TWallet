import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'assets/assets_page.dart';
import 'assets/assets_store.dart';
import 'discovery/discovery.dart';
import 'identity/identity.dart';
import 'my/my_page.dart';

class HomeWidget extends StatefulWidget {
  final int defaultIndex;
  HomeWidget({this.defaultIndex});

  @override
  HomeWidgetState createState() => HomeWidgetState(defaultIndex: defaultIndex);
}

class HomeWidgetState extends State<HomeWidget> {
  final int defaultIndex;
  int _currentIndex = 0;

  HomeWidgetState({this.defaultIndex});

  final List<Widget> _pages = [
    AssetsPage(store: AssetsStore()),
    DiscoveryPage(),
    IdentityPage(),
    MyPage()
  ];

  final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.more), title: Text('发现')),
    BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('身份')),
    BottomNavigationBarItem(icon: Icon(Icons.account_box), title: Text('我')),
  ];

  @override
  void initState() {
    super.initState();
    this._currentIndex = defaultIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: _barItems,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        selectedFontSize: 12,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

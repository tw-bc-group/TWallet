import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme.dart';

import 'assets/assets_page.dart';
import 'assets/assets_store.dart';
import 'my/my_page.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget();

  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget> {
  final List<Widget> _pages = [
    AssetsPageWidget(store: AssetsStore()),
    MyPageWidget()
  ];

  final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    //BottomNavigationBarItem(icon: Icon(Icons.more), title: Text('发现')),
    //BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('身份')),
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('我')),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WalletTheme.bgColor(),
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

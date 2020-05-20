import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/common/http/error_interceptor.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';

import 'assets/assets_page.dart';
import 'discovery/discovery.dart';
import 'identity/identity_page.dart';
import 'my/my_page.dart';

class Home extends StatefulWidget {
  Home({this.defaultIndex = 0});
  final int defaultIndex;

  @override
  HomeState createState() => HomeState(defaultIndex: defaultIndex);
}

class HomeState extends State<Home> {
  HomeState({this.defaultIndex = 0});

  final HomeStore homeStore = HomeStore();
  static final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.more), title: Text('发现')),
    BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('身份')),
    BottomNavigationBarItem(icon: Icon(Icons.account_box), title: Text('我')),
  ];

  static int get identityIndex => 2;

  // _barItems.indexWhere((item) => (item.title as Text).data == '');

  int defaultIndex;
  List<Widget> _pages;

  @override
  void initState() {
    homeStore.changePage(defaultIndex);
    _pages = [AssetsPage(homeStore), DiscoveryPage(homeStore), IdentityPage(), MyPage()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);
    ErrorInterceptor.context = context;
    return Scaffold(
      backgroundColor: WalletColor.primary,
      body: Observer(
          builder: (_) => SafeArea(child: _pages[homeStore.currentPage])),
      bottomNavigationBar: Observer(
          builder: (_) => BottomNavigationBar(
                items: _barItems,
                currentIndex: homeStore.currentPage,
                type: BottomNavigationBarType.fixed,
                fixedColor: WalletColor.primary,
                selectedFontSize: 12,
                onTap: (index) {
                  homeStore.changePage(index);
                },
              )),
    );
  }
}

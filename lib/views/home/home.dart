import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';

import 'assets/assets_page.dart';
import 'assets/assets_store.dart';
import 'discovery/discovery.dart';
import 'identity/identity_page.dart';
import 'my/my_page.dart';

class Home extends StatefulWidget {
  Home({this.defaultIndex = 0});
  final int defaultIndex;

  @override
  HomeState createState() => HomeState(currentIndex: defaultIndex);
}

class HomeState extends State<Home> {
  HomeState({this.currentIndex = 0});

  static final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
    BottomNavigationBarItem(icon: Icon(Icons.more), title: Text('发现')),
    BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('身份')),
    BottomNavigationBarItem(icon: Icon(Icons.account_box), title: Text('我')),
  ];

  static int get identityIndex => 2;
  // _barItems.indexWhere((item) => (item.title as Text).data == '');

  int currentIndex;
  HomeStore homeStore;

  final List<Widget> _pages = [
    AssetsPage(store: AssetsStore()),
    DiscoveryPage(),
    IdentityPage(),
    MyPage()
  ];

  @override
  Widget build(BuildContext context) {
    if (homeStore == null) {
      homeStore = Provider.of<HomeStore>(context);
      homeStore.changeIndex(currentIndex);
    }

    return Scaffold(
      body: SafeArea(child: _pages[homeStore.currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: _barItems,
        currentIndex: homeStore.currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        selectedFontSize: 12,
        onTap: (index) {
          setState(() {
            homeStore.changeIndex(index);
          });
        },
      ),
      floatingActionButton: currentIndex == HomeState.identityIndex
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () =>
                  Application.router.navigateTo(context, Routes.newIdentity))
          : null,
    );
  }
}

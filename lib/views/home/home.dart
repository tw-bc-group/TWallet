import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  static final iconPaths = {
    'home': {
      'unselected': 'assets/icons/bottom_bar/home.svg',
      'selected': 'assets/icons/bottom_bar/home_selected.svg',
    },
    'discovery': {
      'unselected': 'assets/icons/bottom_bar/discovery.svg',
      'selected': 'assets/icons/bottom_bar/discovery_selected.svg',
    },
    'identity': {
      'unselected': 'assets/icons/bottom_bar/identity.svg',
      'selected': 'assets/icons/bottom_bar/identity_selected.svg',
    },
    'me': {
      'unselected': 'assets/icons/bottom_bar/me.svg',
      'selected': 'assets/icons/bottom_bar/me_selected.svg',
    }
  };

  static svgIcon(path) => SvgPicture.asset(path);

  static final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(
        icon: svgIcon(iconPaths['home']['unselected']),
        activeIcon: svgIcon(iconPaths['home']['selected']),
        title: Text('首页')),
    BottomNavigationBarItem(
        icon: svgIcon(iconPaths['discovery']['unselected']),
        activeIcon: svgIcon(iconPaths['discovery']['selected']),
        title: Text('发现')),
    BottomNavigationBarItem(
        icon: svgIcon(iconPaths['identity']['unselected']),
        activeIcon: svgIcon(iconPaths['identity']['selected']),
        title: Text('身份')),
    BottomNavigationBarItem(
        icon: svgIcon(iconPaths['me']['unselected']),
        activeIcon: svgIcon(iconPaths['me']['selected']),
        title: Text('我')),
  ];

  static int get identityIndex => 2;

  // _barItems.indexWhere((item) => (item.title as Text).data == '');

  int defaultIndex;
  List<Widget> _pages;

  @override
  void initState() {
    homeStore.changePage(defaultIndex);
    _pages = [
      AssetsPage(homeStore),
      DiscoveryPage(homeStore),
      IdentityPage(),
      MyPage()
    ];
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

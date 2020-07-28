import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/service/dapp.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';

import 'assets/home_page.dart';
import 'discovery/discovery_page.dart';
import 'identity/identity_page.dart';
import 'my/my_page.dart';

class Home extends StatefulWidget {
  const Home({this.defaultIndex = 0});

  final int defaultIndex;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  HomeState();

  static int get identityIndex => 2;
  static final Map<String, Map<String, String>> iconPaths = {
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

  static SvgPicture svgIcon(String path) => SvgPicture.asset(path);

  static final List<BottomNavigationBarItem> _barItems = [
    BottomNavigationBarItem(
        icon: svgIcon(iconPaths['home']['unselected']),
        activeIcon: svgIcon(iconPaths['home']['selected']),
        title: const Text('首页')),
    BottomNavigationBarItem(
        icon: svgIcon(iconPaths['discovery']['unselected']),
        activeIcon: svgIcon(iconPaths['discovery']['selected']),
        title: const Text('发现')),
    BottomNavigationBarItem(
        icon: svgIcon(iconPaths['identity']['unselected']),
        activeIcon: svgIcon(iconPaths['identity']['selected']),
        title: const Text('身份')),
    BottomNavigationBarItem(
        icon: svgIcon(iconPaths['me']['unselected']),
        activeIcon: svgIcon(iconPaths['me']['selected']),
        title: const Text('我')),
  ];

  final HomeStore homeStore = HomeStore();

  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    homeStore.currentPage = widget.defaultIndex;
    _pages = [
      HomePage(homeStore),
      DiscoveryPage(homeStore),
      IdentityPage(),
      MyPage()
    ];
    getIt<MnemonicsStore>().generateIndexZeroKeys();
  }

  @override
  Widget build(BuildContext context) {
    YYDialog.init(context);
    DAppService.context = context;
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);

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
                onTap: (int index) {
                  homeStore.currentPage = index;
                },
              )),
    );
  }
}

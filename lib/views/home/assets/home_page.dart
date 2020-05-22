import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/home/assets/point_tab.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';
import 'package:tw_wallet_ui/views/home/identity/identity_alert.dart';
import 'package:tw_wallet_ui/widgets/empty_page.dart';

import 'home_page_header.dart';
import 'home_page_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.homeStore);

  final HomeStore homeStore;

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  _HomePageState();

  final IdentityStore _identityStore = getIt<IdentityStore>();
  final ImageProvider avatarImage = AssetImage('assets/images/avatar.png');

  static const _tabs = [
    HomePageTab(
        text: '资产',
        icon: ImageIcon(AssetImage('assets/icons/tab-assets.png'), size: 32)),
    HomePageTab(
        text: '票券',
        icon: ImageIcon(AssetImage('assets/icons/tab-package.png'), size: 32)),
    HomePageTab(
        text: '证书',
        icon: ImageIcon(AssetImage('assets/icons/tab-package.png'), size: 32)),
    HomePageTab(
        text: '收藏',
        icon: ImageIcon(AssetImage('assets/icons/tab-package.png'), size: 32)),
  ];

  static var _tabViews = [PointTab(), EmptyPage(), EmptyPage(), EmptyPage()];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    showDialogIfNoIdentity(
      context,
      widget.homeStore,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Container(
        child: Column(
          children: <Widget>[
            HomePageHeader(
              name: _name,
              avatar: _avatar,
              tabBar: _buildTabBar,
              onAvatarTap: () => _onAvatarTap(context),
            ),
            _mainContent,
          ],
        ),
      ),
    );
  }

  Widget get _mainContent => Expanded(
        child: Container(
          color: WalletColor.backgroundWhite,
          child: TabBarView(
            controller: _tabController,
            children: _tabViews,
          ),
        ),
      );

  String get _name => _identityStore.selectedIdentity
      .map((identity) => identity.name)
      .orElse('');

  Widget get _avatar => Image(width: 80, height: 80, image: avatarImage);

  TabBar get _buildTabBar => TabBar(
        isScrollable: true,
        labelPadding: EdgeInsets.symmetric(horizontal: 6),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(22), color: Colors.white),
        labelColor: WalletColor.primary,
        unselectedLabelColor: Colors.white,
        controller: _tabController,
        tabs: _tabs,
      );

  _onAvatarTap(BuildContext context) {
    _identityStore.selectedIdentity.ifPresent((identity) {
      final path = '${Routes.identityDetail}?id=${identity.id}';
      Application.router.navigateTo(context, path);
    });
  }
}

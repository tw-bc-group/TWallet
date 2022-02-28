import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/home/assets/asset_tab.dart';
import 'package:tw_wallet_ui/views/home/assets/certification_tab.dart';
import 'package:tw_wallet_ui/views/home/assets/point_tab.dart';
import 'package:tw_wallet_ui/views/home/assets/ticket_tab.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';
import 'package:tw_wallet_ui/views/home/identity/identity_alert.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';
import 'package:tw_wallet_ui/widgets/identity_selection_sheet.dart';

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

  final IdentityStore _identityStore = Get.find();

  static const _tabs = [
    HomePageTab(
      text: 'CBDC',
      icon: ImageIcon(AssetImage('assets/icons/tab-assets.png'), size: 32),
    ),
    HomePageTab(
      text: '票券',
      icon: ImageIcon(AssetImage('assets/icons/tab-package.png'), size: 32),
    ),
    HomePageTab(
      text: '证书',
      icon: ImageIcon(AssetImage('assets/icons/tab-package.png'), size: 32),
    ),
    HomePageTab(
      text: '资产',
      icon: ImageIcon(AssetImage('assets/icons/tab-package.png'), size: 32),
    ),
  ];

  static final _tabViews = [
    PointTab(),
    const TicketTab(),
    const CertificationTab(),
    const AssetTab()
  ];

  TabController? _tabController;

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
      builder: (context) => Column(
        children: <Widget>[
          HomePageHeader(
            name: _name,
            avatar: _avatar,
            tabBar: _buildTabBar,
            onAvatarTap: () => _onAvatarTap(context),
            onChangeIdentityTap: () => _onChangeIdentityTap(context),
          ),
          _mainContent,
        ],
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
      .map((identity) => identity.profileInfo.name)
      .orElse('');

  Widget get _avatar => const AvatarWidget(width: 80);

  TabBar get _buildTabBar => TabBar(
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        labelColor: WalletColor.primary,
        unselectedLabelColor: Colors.white,
        controller: _tabController,
        tabs: _tabs,
      );

  void _onAvatarTap(BuildContext context) {
    _identityStore.selectedIdentity.ifPresent((identity) {
      final path = '${Routes.identityDetail}?id=${identity.id}';
      Application.router.navigateTo(context, path);
    });
  }

  Future<void> _onChangeIdentityTap(BuildContext context) {
    final ids = _identityStore.identitiesExceptSelected;
    final selectedIdentity = _identityStore.selectedIdentity;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return IdentitySelectionSheet(
          identities: ids,
          onSheetItemTap: (index) => _onIdentityCardTap(context, ids[index]),
          selectedIdentity: selectedIdentity.value,
        );
      },
    );
  }

  void _onIdentityCardTap(
      BuildContext context, DecentralizedIdentity identity) {
    _identityStore.selectIdentity(identity);
    Navigator.pop(context);
  }
}

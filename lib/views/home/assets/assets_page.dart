import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/home/assets/point_tab.dart';
import 'package:tw_wallet_ui/views/home/assets/token_tab.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';
import 'package:tw_wallet_ui/views/home/identity/identity_alert.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';

import 'home_page_header.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage(this.homeStore);

  final HomeStore homeStore;

  @override
  State<StatefulWidget> createState() => _AssetsPageState(homeStore);
}

class _AssetsPageState extends State<AssetsPage>
    with SingleTickerProviderStateMixin {
  _AssetsPageState(this.homeStore);

  final HomeStore homeStore;
  final IdentityStore _identityStore = getIt<IdentityStore>();
  final Map<AssetsType, String> _tabs = {
    AssetsType.point: '积分',
    AssetsType.token: '资产'
  };

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    showDialogIfNoIdentity(
      context,
      homeStore,
    );
  }

  Widget buildHeader(
      {@required Optional<Identity> selectedIdentity,
      @required List<Identity> identities}) {
    List<Widget> children = <Widget>[
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Container(
          padding: EdgeInsets.all(15),
          child: selectedIdentity
              .map<Widget>(
                  (identity) => AvatarWidget(avataaar: identity.avataaar))
              .orElse(Container()),
        ),
        onTap: () {
          selectedIdentity.ifPresent((identity) {
            Application.router.navigateTo(
                context, '${Routes.identityDetail}?id=${identity.id}');
          });
        },
      ),
      SizedBox(width: 10),
      Expanded(
          child: Text(
              selectedIdentity.map((identity) => identity.name).orElse(''))),
    ];

    if (identities.length > 1) {
      children.add(
        PopupMenuButton(
          icon: Icon(Icons.apps),
          initialValue: _identityStore.selectedIndex,
          itemBuilder: (BuildContext context) {
            return identities
                .asMap()
                .map((index, identity) => MapEntry(
                    index,
                    PopupMenuItem(
                      child: Text(identity.name,
                          style: TextStyle(fontWeight: FontWeight.w700)),
                      value: index,
                      enabled: _identityStore.selectedIndex != index,
                    )))
                .values
                .toList();
          },
          onSelected: (int index) {
            _identityStore.selectIdentity(index: index);
          },
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) => Observer(builder: (context) {
        final avatar = _identityStore.selectedIdentity
            .map<Widget>((identity) =>
                AvatarWidget(width: 80, avataaar: identity.avataaar, hasBoarder: true))
            .orElse(Container());

        final name = _identityStore.selectedIdentity
            .map((identity) => identity.name)
            .orElse('');

        return Container(
            child: Column(children: <Widget>[
          HomePageHeader(
            name: _buildName(name),
            avatar: avatar,
            tabBar: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                tabs: _tabs.values.map((t) => Tab(text: t)).toList()),
          ),
//              buildHeader(
//                  selectedIdentity: _identityStore.selectedIdentity,
//                  identities: _identityStore.identities),
          Expanded(
              child: Container(
                  color: WalletTheme.mainBgColor,
                  child: TabBarView(
                    controller: _tabController,
                    children: [PointTab(), TokenTab()],
                  ))),
        ]));
      });

  _buildName(String name) => Text(
        name,
        style: TextStyle(
          fontFamily: 'PingFangHK',
          color: Color(0xffffffff),
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),
      );
}

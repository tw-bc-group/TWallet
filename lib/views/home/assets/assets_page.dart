import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:optional/optional_internal.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/views/home/assets/point_tab.dart';
import 'package:tw_wallet_ui/views/home/assets/token_tab.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage();

  @override
  State<StatefulWidget> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage>
    with SingleTickerProviderStateMixin {
  final IdentityStore _store = getIt<IdentityStore>();
  final Map<AssetsType, String> _tabs = {
    AssetsType.point: '积分',
    AssetsType.token: '资产'
  };

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  Widget buildHeader(
      {@required Optional<Identity> selectedIdentity,
      @required List<Identity> identities}) {
    List<Widget> children = <Widget>[
      Container(
        padding: EdgeInsets.all(15),
        child: selectedIdentity.isPresent
            ? CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'))
            : Container(),
      ),
      SizedBox(width: 10),
      Text(selectedIdentity.map((identity) => identity.name).orElse('')),
      Expanded(child: Container()),
    ];

    if (identities.isNotEmpty) {
      children.add(
        PopupMenuButton(
          icon: Icon(Icons.apps),
          itemBuilder: (BuildContext context) {
            return identities
                .where((identity) =>
                    identity.name !=
                    selectedIdentity
                        .map((identity) => identity.name)
                        .orElse(''))
                .map((identity) => PopupMenuItem(
                    child: Text(identity.name), value: identity.name))
                .toList();
          },
          onSelected: (String value) {
            _store.selectIdentity(name: value);
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
        return Container(
            color: WalletTheme.titleBgColor,
            child: Column(children: <Widget>[
              buildHeader(
                  selectedIdentity: _store.selectedIdentity,
                  identities: _store.identities),
              TabBar(
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  tabs: _tabs.values.map((t) => Tab(text: t)).toList()),
              Expanded(
                  child: Container(
                      color: WalletTheme.mainBgColor,
                      child: TabBarView(
                        controller: _tabController,
                        children: [PointTab(), TokenTab()],
                      ))),
            ]));
      });
}

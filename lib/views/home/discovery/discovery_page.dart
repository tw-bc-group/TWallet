import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/dapp_list.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/home/discovery/discovery_item.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';

class DiscoveryPage extends StatelessWidget {
  final HomeStore homeStore;

  const DiscoveryPage(this.homeStore);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _header,
            _mainContent,
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          margin: const EdgeInsets.only(top: 68),
          child: _dappList(context: context),
        ),
      ],
    );
  }

  Widget _dappList({BuildContext context}) {
    final List<Widget> dappItemList = <Widget>[
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.healthCertPage,
            arguments: homeStore),
        child: const DiscoveryItem(text: '健康认证'),
      ),
      GestureDetector(
        onTap: () => throw StateError('this is test error'),
        child: const DiscoveryItem(text: 'Error Report Test'),
      )
    ];
    dappItemList.addAll(dappList.map((dapp) => GestureDetector(
          onTap: () => Application.router
              .navigateTo(context, '${Routes.dapp}?id=${dapp.id}'),
          child: DiscoveryItem(text: dapp.name, svgAsset: dapp.iconAsset),
        )));
    return ListView(
      children: dappItemList,
    );
  }

  Widget get _header {
    return Container(
      height: 138,
      color: WalletColor.primary,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: const <Widget>[
          Center(
            child: Text("发现",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                )),
          ),
        ],
      ),
    );
  }

  Widget get _mainContent {
    return Expanded(
      child: Container(
        color: WalletColor.backgroundWhite,
      ),
    );
  }
}

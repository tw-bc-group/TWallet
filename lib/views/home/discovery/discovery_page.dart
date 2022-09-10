import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/dapp_list.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/generated/l10n.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/home/discovery/discovery_item.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';
import 'package:tw_wallet_ui/widgets/header.dart';

class DiscoveryPage extends StatelessWidget {
  final HomeStore homeStore;

  const DiscoveryPage(this.homeStore);

  static TextStyle headerTextStyle =
      WalletFont.font_18(textStyle: TextStyle(color: WalletColor.white));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Header(
              title: S.of(context).pageDiscoveryDiscovery,
              height: 138,
              textStyle: headerTextStyle,
            ),
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

  Widget _dappList({required BuildContext context}) {
    final List<Widget> dappItemList = <Widget>[
      GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          Routes.healthCertPage,
          arguments: homeStore,
        ),
        child: DiscoveryItem(text: S.of(context).pageDiscoveryHealthCert),
      )
    ];

    dappItemList.add(
      GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          Routes.ownVcPage,
          arguments: homeStore,
        ),
        child: DiscoveryItem(
          text: S.of(context).pageDiscoveryMoreVc,
          svgAsset: 'assets/icons/vc.svg',
        ),
      ),
    );

    dappItemList.add(
      GestureDetector(
        onTap: () => Navigator.pushNamed(
          context,
          Routes.verificationScenarioPage,
          arguments: homeStore,
        ),
        child: DiscoveryItem(
          text: S.of(context).pageDiscoveryVerificationSenario,
          svgAsset: 'assets/icons/verification-scenario.svg',
        ),
      ),
    );

    dappItemList.addAll(
      dappList.map(
        (dapp) => GestureDetector(
          onTap: () => Application.router
              .navigateTo(context, '${Routes.dapp}?id=${dapp.id}'),
          child: DiscoveryItem(text: dapp.name, svgAsset: dapp.iconAsset),
        ),
      ),
    );
    return ListView(
      children: dappItemList,
    );
  }

  Widget get _mainContent {
    return Expanded(
      child: ColoredBox(
        color: WalletColor.backgroundWhite,
      ),
    );
  }
}

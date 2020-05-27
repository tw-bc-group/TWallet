import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/home/discovery/discovery_item.dart';
import 'package:tw_wallet_ui/views/home/home_store.dart';
import 'package:tw_wallet_ui/views/home/identity/identity_alert.dart';

class DiscoveryPage extends StatelessWidget {
  final HomeStore homeStore;

  DiscoveryPage(this.homeStore);

  @override
  Widget build(BuildContext context) {
    showDialogIfNoIdentity(
      context,
      homeStore,
    );

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
          padding: EdgeInsets.symmetric(horizontal: 24),
          margin: EdgeInsets.only(top: 68),
          child: _healthItem(context: context),
        ),
      ],
    );
  }

  Widget _healthItem({BuildContext context}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.healthCertPage),
      child: DiscoveryItem(text: "健康认证"),
    );
  }

  Widget get _header {
    return Container(
      height: 138,
      color: WalletColor.primary,
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Center(
            child: Text("发现",
                style: TextStyle(
                  color: Color(0xffffffff),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 1,
                )),
          ),
        ],
      ),
    );
  }

  get _mainContent {
    return Expanded(
      child: Container(
        color: WalletColor.backgroundWhite,
      ),
    );
  }
}

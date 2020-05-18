import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/global/widgets/page_title.dart';
import 'package:tw_wallet_ui/router/routers.dart';

class DiscoveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      backIcon: BackIcon.NONE,
      title: '发现',
      childBuilder: (context, constraints) => Container(
        padding: EdgeInsets.all(18),
        child: ListView(
          children: [_healthItem(context: context)],
        ),
      ),
    );
  }

  Widget _healthItem({BuildContext context}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, Routes.healthCode),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: WalletTheme.listItemBgColor,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 2.0)],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Text("健康认证"),
            ],
          ),
        ),
      ),
    );
  }
}

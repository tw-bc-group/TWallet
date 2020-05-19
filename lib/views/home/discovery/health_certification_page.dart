import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/global/common/theme/index.dart';
import 'package:tw_wallet_ui/global/store/health_certification_store.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/widgets/avatar.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/global/widgets/page_title.dart';
import 'package:tw_wallet_ui/models/identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';


class HealthCertificationPage extends StatelessWidget {
  final IdentityStore _identityStore = getIt<IdentityStore>();
  final HealthCertificationStore certStore = getIt<HealthCertificationStore>();

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      backIcon: BackIcon.ARROW,
      title: "健康认证",
      childBuilder: (context, constraints) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildTips(context), _buildIdList(context)],
      ),
    );
  }

  Widget _buildTips(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "使用TW Wallet的身份登录健康认证",
              style: TextStyle(fontSize: 18),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text("选择您想使用的身份",
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            )
          ],
        ));
  }

  List<Widget> _buildDataSource(BuildContext context, List<Identity> ids) {
    final index = _identityStore.healthCertLastSelectIndex;
    ids.insert(0, ids.removeAt(index));
    return ids
        .map((e) => Card(
            color: WalletTheme.rgbColor('#f2f2f2'),
            child: ListTile(
              leading: AvatarWidget(avataaar: e.avataaar),
              title: Text(e.name),
              subtitle: Text(e.address),
              onTap: () => onIdentityTap(context, e),
              selected: false,
            )))
        .toList();
  }

  Widget _buildIdList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey, blurRadius: 7.0, offset: Offset(0.0, -10))
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height / 2,
        color: WalletTheme.rgbColor('#f2f2f2'),
        child: Column(
          children: <Widget>[
            Divider(),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: _buildDataSource(context, _identityStore.identities.toList()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future onIdentityTap(BuildContext context, Identity identity) async {
    await certStore.fetchHealthCertByDID(identity.did.toString());
    _identityStore.updateHealthCertLastSelected(identity);

    var path = certStore.isBoundCert
        ? '${Routes.healthCode}?id=${identity.id}'
        : '${Routes.certificate}?id=${identity.id}';
    Application.router.navigateTo(context, path);
  }
}

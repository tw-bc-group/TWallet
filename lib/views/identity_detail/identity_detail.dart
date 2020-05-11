import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/global/common/application.dart';
import 'package:tw_wallet_ui/global/store/health_certification_store.dart';
import 'package:tw_wallet_ui/global/widgets/avatar.dart';
import 'package:tw_wallet_ui/global/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/views/identity_detail/widgets/detail_row.dart';

import '../../global/common/get_it.dart';
import '../../global/store/identity_store.dart';
import '../../models/identity.dart';

class IdentityDetailPage extends StatelessWidget {
  final String id;
  final IdentityStore identityStore = getIt<IdentityStore>();
  final HealthCertificationStore certStore = getIt<HealthCertificationStore>();

  IdentityDetailPage({this.id});

  Identity getIdentity() {
    var identityResult;
    identityStore.identities.forEach((identity) {
      if (identity.id == id) {
        identityResult = identity;
      }
    });
    return identityResult;
  }

  String certTitle() {
    return certStore.isBoundCert ? '健康码' : '健康认证';
  }

  onHealthBtnTap(BuildContext context) {
    var path = certStore.isBoundCert
        ? '${Routes.healthCode}?id=$id'
        : '${Routes.certificate}?id=$id';
    Application.router.navigateTo(context, path);
  }

  @override
  Widget build(BuildContext context) {
    var identity = getIdentity();
    certStore.fetchHealthCert(identity.did.toString());

    return CommonLayout(
      title: '个人信息',
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 0),
        child: ListView(children: <Widget>[
          DetailRowWidget(
            name: '头像',
            value: AvatarWidget(avataaar: identity.avataaar),
          ),
          DetailRowWidget(name: '名称*', value: identity.name),
          DetailRowWidget(name: '邮箱', value: identity.email),
          DetailRowWidget(name: '电话', value: identity.phone),
          DetailRowWidget(name: '生日', value: identity.birthday ?? ''),
          DetailRowWidget(name: 'DID', value: identity.did.toString()),
          DetailRowWidget(name: '二维码名片', value: _buildQR(context, identity)),
          DetailRowWidget(value: buildHealthBtn(context))
        ]),
      ),
    );
  }

  Widget buildHealthBtn(BuildContext context) {
    return Observer(builder: (BuildContext context) {
      return GestureDetector(
        onTap: () => onHealthBtnTap(context),
        child: Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Center(
            child: Text(
              certTitle(),
              style: TextStyle(
                  fontSize: 12, color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildQR(BuildContext context, Identity id) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.center_focus_strong),
            Icon(Icons.keyboard_arrow_right),
          ],
        ),
      ),
      onTap: () => Navigator.pushNamed(context, Routes.qrPage, arguments: id),
    );
  }
}

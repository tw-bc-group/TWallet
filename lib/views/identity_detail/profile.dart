import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/identity_detail/widgets/profile_row.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import '../../models/identity.dart';

class ProfilePage extends StatelessWidget {
  final String id;
  final IdentityStore identityStore = getIt<IdentityStore>();
  final HealthCertificationStore certStore = getIt<HealthCertificationStore>();

  ProfilePage({this.id});

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
    certStore.fetchHealthCertByDID(identity.did.toString());

    return CommonLayout(
      title: '个人信息',
      childBuilder: (context, constraints) => ListView(children: <Widget>[
        ProfileRowWidget(
          name: '头像',
          value: AvatarWidget(),
        ),
        ProfileRowWidget(name: '名称*', value: identity.name),
        ProfileRowWidget(name: '邮箱', value: identity.email),
        ProfileRowWidget(name: '电话', value: identity.phone),
        ProfileRowWidget(name: '生日', value: identity.birthday ?? ''),
        ProfileRowWidget(name: 'DID', value: identity.did.toString()),
        ProfileRowWidget(name: '二维码名片', value: _buildQR(context, identity)),
        ProfileRowWidget(value: buildHealthBtn(context))
      ]),
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

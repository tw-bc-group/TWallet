import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/get_it.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/profile/widgets/profile_row.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/new_common_layout.dart';

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

    return NewCommonLayout(
      title: '个人信息',
      child: Container(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 40),
            child: AvatarWidget(),
            alignment: Alignment.center,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: WalletColor.white
              ),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: <Widget>[
                  ProfileRowWidget(assetIcon: 'assets/icons/name.svg', name: '名称*', value: identity.name),
                  ProfileRowWidget(assetIcon: 'assets/icons/email.svg', name: '邮箱', value: identity.email),
                  ProfileRowWidget(assetIcon: 'assets/icons/phone.svg', name: '电话', value: identity.phone),
                  ProfileRowWidget(assetIcon: 'assets/icons/birth.svg', name: '生日', value: identity.birthday ?? ''),
                  GestureDetector(
                    child: ProfileRowWidget(assetIcon: 'assets/icons/eye.svg', name: 'DID', value: identity.did.toString()),
                    onLongPress: () async {
                      Clipboard.setData(ClipboardData(text: identity.did.toString()));
                      await showDialogSample(context, DialogType.none, '复制成功');
                    },
                  ),
                  ProfileRowWidget(assetIcon: 'assets/icons/qrcode.svg', name: '二维码名片', value: _buildQR(context, identity), withoutBottomBorder: true),
                  // ProfileRowWidget(value: buildHealthBtn(context))
                ],
              ),
            )
          )
        ]),
      ),
    );
  }

  // Widget buildHealthBtn(BuildContext context) {
  //   return Observer(builder: (BuildContext context) {
  //     return GestureDetector(
  //       onTap: () => onHealthBtnTap(context),
  //       child: Container(
  //         width: 70,
  //         height: 30,
  //         decoration: BoxDecoration(
  //           border: Border.all(width: 2, color: Theme.of(context).primaryColor),
  //           borderRadius: BorderRadius.all(Radius.circular(8)),
  //         ),
  //         child: Center(
  //           child: Text(
  //             certTitle(),
  //             style: TextStyle(
  //                 fontSize: 12, color: Theme.of(context).primaryColor),
  //           ),
  //         ),
  //       ),
  //     );
  //   });
  // }

  Widget _buildQR(BuildContext context, Identity id) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/right-arrow.svg',
              color: WalletColor.grey
            )
          ],
        ),
      ),
      onTap: () => Navigator.pushNamed(context, Routes.qrPage, arguments: id),
    );
  }
}

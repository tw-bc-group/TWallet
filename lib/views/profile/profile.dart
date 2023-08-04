import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/profile/widgets/profile_row.dart';
import 'package:tw_wallet_ui/widgets/avatar.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class ProfilePage extends StatelessWidget {
  final String id;
  final IdentityStore identityStore = Get.find();
  final HealthCertificationStore certStore = Get.find();

  ProfilePage({required this.id});

  String certTitle() {
    return certStore.isBoundCert ? '健康码' : '健康认证';
  }

  void onHealthBtnTap(BuildContext context) {
    final String path = certStore.isBoundCert
        ? '${Routes.healthCode}?id=$id'
        : '${Routes.certificate}?id=$id';
    Application.router.navigateTo(context, path);
  }

  @override
  Widget build(BuildContext context) {
    final DecentralizedIdentity? identity = identityStore.getIdentityById(id);
    certStore.fetchHealthCertByDID(identity!.did.toString());

    return CommonLayout(
      title: 'Personal information',
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            alignment: Alignment.center,
            child: const AvatarWidget(),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: WalletColor.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                children: <Widget>[
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/name.svg',
                    name: 'Name*',
                    value: identity.profileInfo.name,
                  ),
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/email.svg',
                    name: 'Mail',
                    value: identity.profileInfo.email,
                  ),
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/phone.svg',
                    name: 'Phone',
                    value: identity.profileInfo.phone,
                  ),
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/birth.svg',
                    name: 'Birthday',
                    value: identity.profileInfo.birthday ?? '',
                  ),
                  GestureDetector(
                    onLongPress: () async {
                      return Clipboard.setData(
                        ClipboardData(text: identity.did.toString()),
                      ).then(
                          (_) => showDialogSimple(DialogType.none, 'Copied'));
                    },
                    child: ProfileRowWidget(
                      assetIcon: 'assets/icons/eye.svg',
                      name: 'DID',
                      value: identity.did.toString(),
                    ),
                  ),
                  ProfileRowWidget(
                    assetIcon: 'assets/icons/qrcode.svg',
                    name: 'My QR Code',
                    value: _buildQR(context, identity),
                    withoutBottomBorder: true,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQR(BuildContext context, DecentralizedIdentity id) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pushNamed(context, Routes.qrPage, arguments: id),
      child: Container(
        padding: const EdgeInsets.only(bottom: 8, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/right-arrow.svg',
              color: WalletColor.grey,
            )
          ],
        ),
      ),
    );
  }
}

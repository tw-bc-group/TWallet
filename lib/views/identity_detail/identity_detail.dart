import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/identity/decentralized_identity.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/views/identity_detail/widgets/certificate_card.dart';
import 'package:tw_wallet_ui/views/identity_detail/widgets/identity_basic_info.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class IdentityDetailPage extends StatelessWidget {
  final IdentityStore identityStore = Get.find();
  final HealthCertificationStore certStore = Get.find();
  final String id;

  IdentityDetailPage({this.id});

  String certTitle() {
    return certStore.currentToken.isPresent ? '健康码' : '健康认证';
  }

  void onHealthBtnTap(BuildContext context) {
    final String path = certStore.isBoundCert
        ? '${Routes.healthCode}?id=$id'
        : '${Routes.certificate}?id=$id';
    Application.router.navigateTo(context, path);
  }

  @override
  Widget build(BuildContext context) {
    final DecentralizedIdentity identity = identityStore.getIdentityById(id);
    certStore.fetchHealthCertByDID(identity.did.toString());
    return CommonLayout(
      title: identity.profileInfo.name,
      child: Container(
          margin: const EdgeInsets.only(top: 24),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: <Widget>[
              IdentityBasicInfoWidget(id: id),
              Container(
                margin: const EdgeInsets.only(top: 40),
                child: Text(
                  '- 认证 -',
                  style: WalletFont.font_18(
                      textStyle: TextStyle(color: WalletColor.white)),
                  textAlign: TextAlign.center,
                ),
              ),
              Observer(
                  builder: (context) => CertificateCardWidget(
                      title: '健康认证',
                      onTap: () => onHealthBtnTap(context),
                      routeTitle: certTitle()))
            ],
          )),
    );
  }
}

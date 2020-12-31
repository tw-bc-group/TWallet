import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/vc_store.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/verifiable_credential_card.dart';

class ComposeVcPage extends StatelessWidget {
  ComposeVcPage();

  final VcStore _store = Get.find();

  get vcpr => _store.vcpr;

  @override
  Widget build(BuildContext context) {

    print("find: ${vcpr.toJson()}");

    List<VerifiableCredential> vcs = <VerifiableCredential>[];

    for (final vcType in vcpr.vcTypes) {
      switch(vcType.toString()) {
        case "qSARS-CoV-2-Rapid-Test-Credential": {
          vcs.add(VerifiableCredential(
            name: "行乘健康码",
            issuer: "中国移动",
          ));
        }
        break;

        case "ImmunoglobulinDetectionTestCard": {
          vcs.add(VerifiableCredential(
            name: "核算检查",
            issuer: "某某检测机构",
          ));
        }
        break;

        default: {
          print("unknow vc type id: ${vcType}");
        }
        break;
      }
    }

    final List<Widget> list = <Widget>[];

    list.add(_header);
    vcs.forEach((vc) {
      list.add(VerifiableCredentialCard(vc: vc));
    });
    list.add(_bottom(context));

    return CommonLayout(
      title: "选择凭据",
      child: Stack(
        children: <Widget>[
          ListView(
              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
              children: list),
        ],
      ),
    );
  }

  Widget get _header {
    return Container(
      height: 70,
      color: WalletColor.primary,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: const <Widget>[
          Center(
            child: Text("【某医院患者通行】请求验证以下凭证\n请确认是否同意？",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5,
                )),
          ),
        ],
      ),
    );
  }

  Widget _bottom(BuildContext context) {
    return Column(
      children: <Widget>[
        WalletTheme.button(
          text: '同意并生成验证二维码',
          onPressed: () {
            Application.router.navigateTo(context, Routes.passPage);
          },
        ),
        WalletTheme.button(
          text: '拒绝',
          onPressed: () {},
        ),
      ],
    );
  }
}

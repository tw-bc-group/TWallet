import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/vc_pass.dart';
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
            child: Text("【地坛医院】请求验证以下凭证\n请确认是否同意？",
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
          onPressed: () async {
            const jwtTokenStr = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2MDkzOTk0NTIsImV4cCI6MTY0MDkzNTQ1MiwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkdpdmVuTmFtZSI6IkpvaG5ueSIsIlN1cm5hbWUiOiJSb2NrZXQiLCJFbWFpbCI6Impyb2NrZXRAZXhhbXBsZS5jb20iLCJSb2xlIjpbIk1hbmFnZXIiLCJQcm9qZWN0IEFkbWluaXN0cmF0b3IiXX0.Wmyf8ennODBbw7MZtzG7BUSOxSTMYzvl_F-mqIZhjds";
            final vcPass = VcPass(name: _store.vcpr.name as String, token: jwtTokenStr);
            await _store.setPass(vcPass);
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

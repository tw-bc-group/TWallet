import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/verifiable_credential_card.dart';

class ComposeVcPage extends StatelessWidget {
  ComposeVcPage();

  @override
  Widget build(BuildContext context) {
    final List<VerifiableCredential> vcs = <VerifiableCredential>[
      VerifiableCredential(name: "行乘健康码", issuer: "中国移动"),
      VerifiableCredential(
        name: "核算检查",
        issuer: "某某检测机构",
      ),
      VerifiableCredential(
        name: "出境记录",
        issuer: "出入境管理机构",
      )
    ];

    final List<Widget> list = <Widget>[];

    list.add(_header);
    vcs.forEach((vc) {
      list.add(VerifiableCredentialCard(vc: vc));
    });
    list.add(_bottom);

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

  Widget get _bottom {
    return Column(
      children: <Widget>[
        WalletTheme.button(
          text: '同意并生成验证二维码',
          onPressed: () {},
        ),
        WalletTheme.button(
          text: '拒绝',
          onPressed: () {},
        ),
      ],
    );
  }
}

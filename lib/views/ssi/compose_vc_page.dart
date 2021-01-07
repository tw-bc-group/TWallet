import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/vc_pass.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/ssi.dart';
import 'package:tw_wallet_ui/store/vc_store.dart';
import 'package:tw_wallet_ui/widgets/header.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/verifiable_credential_card.dart';

class ComposeVcPage extends StatelessWidget {
  ComposeVcPage();

  final VcStore _store = Get.find();

  VerifiableCredentialPresentationRequest get vpReq => _store.vpReq;

  @override
  Widget build(BuildContext context) {
    List<VerifiableCredential> vcs = _store.vcs;

    final List<Widget> list = <Widget>[];

    list.add(Header(title: "【${vpReq.name}】请求验证以下凭证\n请确认是否同意？"));
    for (final VerifiableCredential v in vcs) {
      list.add(VerifiableCredentialCard(vc: v));
    }
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

  Widget _bottom(BuildContext context) {
    return Column(
      children: <Widget>[
        WalletTheme.button(
          text: '同意并生成验证二维码',
          onPressed: () async {
            try {
              final List<String> vcTokens =
                  _store.vcs.map((vc) => vc.token).toList();
              final VerifiableCredentialTokenResponse vctr =
                  await SsiService.verifyAndGetPassport(vcTokens);
              final vcPass = VcPass(name: vpReq.name, token: vctr.token);
              _store.vcPass = vcPass;
              Application.router.navigateTo(context, Routes.passPage);
            } catch (err) {
              await hintDialogHelper(context, DialogType.error, "$err");
            }
          },
        ),
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/vc_pass.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/ssi.dart';
import 'package:tw_wallet_ui/store/issuer_store.dart';
import 'package:tw_wallet_ui/store/vc_store.dart';
import 'package:tw_wallet_ui/widgets/header.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/verifiable_credential_card.dart';

class ComposeVcPage extends StatelessWidget {
  ComposeVcPage();

  final VcStore _store = Get.find();
  final IssuerStore _issuerStore = Get.find();
  final List<VerifiableCredential> _acquiredVcs = <VerifiableCredential>[];

  VerifiableCredentialPresentationRequest get vpReq => _store.vpReq;
  bool _hasAllNeededVcs = true;

  @override
  Widget build(BuildContext context) {
    final List<VerifiableCredential> vcs = _store.vcs;

    final List<Widget> list = <Widget>[];
    list.add(Header(title: "【${vpReq.name}】请求验证以下凭证\n请确认是否同意？"));
    for (final String vcTypeId in _store.vpReq.vcTypes) {
      final List<VerifiableCredential> relatedVcs =
          vcs.where((vc) => vc.vcTypeId == vcTypeId).toList();
      if (relatedVcs.isNotEmpty) {
        list.add(VerifiableCredentialCard(vc: relatedVcs.last));
        _acquiredVcs.add(relatedVcs.last);
      } else {
        final VcType vcType = _issuerStore
            .getVcTypes()
            .firstWhere((vcType) => vcType.id == vcTypeId);
        list.add(VerifiableCredentialCard(
          vc: VerifiableCredential(
            name: vcType.name,
            issuer: _issuerStore.getIssuerNameByVcTypeId(vcTypeId),
            content: vcType.content.toList(),
          ),
          isMissing: true,
        ));
        // list.add(_lackVc(vcName));
        _hasAllNeededVcs = false;
      }
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
          text: _hasAllNeededVcs ? '同意并生成验证二维码' : '缺少部分凭证，请返回申请',
          onPressed:
              _hasAllNeededVcs ? () => _verifyAndGetTravelBadge(context) : null,
        ),
      ],
    );
  }

  Future<void> _verifyAndGetTravelBadge(BuildContext context) async {
    try {
      final List<String> vcTokens = _acquiredVcs.map((vc) => vc.token).toList();
      final VerifiableCredentialTokenResponse vctr =
          await SsiService.verifyAndGetPassport(vcTokens);
      final vcPass = VcPass(name: vpReq.name, token: vctr.token);
      _store.vcPass = vcPass;
      Application.router.navigateTo(context, Routes.passPage);
    } catch (err) {
      await hintDialogHelper(context, DialogType.error, "$err");
    }
  }

  Widget _lackVc(String name) {
    return Text(
      "缺少凭证：$name",
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        height: 1.5,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/issuer_response.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/store/issuer_store.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/verifiable_credential_card.dart';

class ApplyVcPage extends StatelessWidget {

  final IssuerStore _store = Get.find();

  ApplyVcPage() {
    print(_store.getVcTypes());
  }

  Widget _issuerTitle(String name) {
    return Text(name,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
        ));
  }

  Widget _vcCard(VcType vcType, VcStatus vcStatus) {
    return VerifiableCredentialCard(
        vc: VerifiableCredential(
          name: vcType.name,
          issuer: "某某检测机构",
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> list = <Widget>[];
    for (final IssuerResponse issuer in _store.issuers) {
      if (issuer.vcTypes.isEmpty) {
        continue;
      }
      list.add(_issuerTitle(issuer.name));
      for (final VcType vcType in issuer.vcTypes) {
        list.add(_vcCard(vcType, VcStatus.notApplied));
      }
    }

    return CommonLayout(
      title: "凭证申请",
      child: Stack(
        children: <Widget>[
          ListView(
              padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
              children: list),
        ],
      ),
    );
  }

}
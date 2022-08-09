import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/issuer_response.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/store/issuer_store.dart';
import 'package:tw_wallet_ui/store/vc_store.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/verifiable_credential_with_button_card.dart';

class ApplyVcPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ApplyVcPageState();
}

class _ApplyVcPageState extends State<ApplyVcPage> with RouteAware {
  final IssuerStore _issuerStore = Get.find();
  final VcStore _vcStore = Get.find();

  List<IssuerResponse> _issuers = <IssuerResponse>[];
  List<VerifiableCredential> _vcs = <VerifiableCredential>[];

  @override
  void initState() {
    super.initState();
    _issuers = _issuerStore.issuers;
    _vcs = _vcStore.vcs;
  }

  void _updateVc() {
    setState(() {
      _vcs = _vcStore.vcs;
    });
  }

  Widget _issuerTitle(String name) {
    return Text(
      name,
      textAlign: TextAlign.left,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
      ),
    );
  }

  Widget _vcCard(VcType vcType, VcStatus vcStatus) {
    return VerifiableCredentialWithButtonCard(
      vcType: vcType,
      vcStatus: vcStatus,
      onFinish: _updateVc,
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> list = <Widget>[];
    for (final IssuerResponse issuer in _issuers) {
      if (issuer.vcTypes.isEmpty) {
        continue;
      }
      list.add(_issuerTitle(issuer.name));
      for (final VcType vcType in issuer.vcTypes) {
        if (_vcs.where((vc) => vc.vcTypeId == vcType.id).toList().isEmpty) {
          list.add(_vcCard(vcType, VcStatus.notApplied));
        } else {
          list.add(_vcCard(vcType, VcStatus.applied));
        }
      }
    }

    return CommonLayout(
      title: "凭证申请",
      child: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            children: list,
          ),
        ],
      ),
    );
  }
}

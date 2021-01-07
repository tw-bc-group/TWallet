import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/ssi.dart';
import 'package:tw_wallet_ui/store/issuer_store.dart';
import 'package:tw_wallet_ui/store/vc_store.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/verifiable_credential_card.dart';

class OwnVcPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OwnVcPageState();
}

class _OwnVcPageState extends State<OwnVcPage> {

  List<VerifiableCredential> _vcs = <VerifiableCredential>[];

  @override
  void initState() {
    super.initState();
    _vcs = Get.find<VcStore>().vcs;
    Get.find<IssuerStore>().fetchIssuers();
  }

  void updateVcs() {
    setState(() {
      _vcs = Get.find<VcStore>().vcs;
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> list = <Widget>[];
    for (final vc in _vcs) {
      list.add(VerifiableCredentialCard(vc: vc));
    }

    return CommonLayout(
      appBarActions: <Widget>[
        _buildScanIcon(context),
      ],
      title: "我的凭证",
      child: Column(
        children: [
          _tips,
          Expanded(
            child: ListView(
                padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
                children: list),
          ),
          _bottom(context),
        ],
      ),
    );
  }

  Widget get _tips {
    return Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            const Text(
              "选择右上角扫描\n获取验证方二维码，获取所需出示凭证",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
                height: 1.5,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 14, bottom: 14),
                width: 167,
                height: 1,
                decoration: const BoxDecoration(color: Color(0xffffffff))),
            _noVcHint(),
          ],
        ));
  }

  Widget _buildScanIcon(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24, top: 6),
      child: GestureDetector(
        onTap: () => _handleScan(context),
        child: SvgPicture.asset(
          'assets/icons/scan.svg',
          color: WalletColor.white,
          width: 32,
          height: 32,
        ),
      ),
    );
  }

  Future<void> _handleScan(BuildContext context) async {
    final String scanResult = await Application.router
        .navigateTo(context, Routes.qrScanner) as String;

    if (null == scanResult) {
      return;
    }

    return Future.delayed(const Duration(milliseconds: 500)).then((_) async {
      try {
        await hintDialogHelper(context, DialogType.success, scanResult, subText: "二维码原始内容");
        VerifiableCredentialPresentationRequest vpr = await SsiService.createVerifiableCredentialPresentationRequest(scanResult);
        Get.find<VcStore>().vpReq = vpr;
        print(vpr.toJson());
        Application.router.navigateTo(context, Routes.composeVcPage);
      } catch (e) {
        await hintDialogHelper(context, DialogType.warning, e.toString());
      }
    });
  }

  Widget _bottom(BuildContext context) {
    return Column(
      children: <Widget>[
        WalletTheme.button(
          text: '申请新凭证',
          onPressed: () {
            Application.router
                .navigateTo(context, Routes.applyVcPage)
                .then((value) => updateVcs());
          },
        ),
      ],
    );
  }

  Widget _noVcHint() {
    if (_vcs.isEmpty) {
      return const Text(
        "管理你所申请的凭证\n也可以点击申新的凭证",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          height: 1.5,
        ),
      );
    }
    return const Text('');
  }
}

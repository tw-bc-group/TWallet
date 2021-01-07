import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/issuer_response.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/store/issuer_store.dart';
import 'package:tw_wallet_ui/widgets/card_group.dart';
import 'package:tw_wallet_ui/widgets/header.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/vc_type_card.dart';

class VerificationScenarioPage extends StatefulWidget {
  @override
  _VerificationScenarioPage createState() => _VerificationScenarioPage();
}

class _VerificationScenarioPage extends State<VerificationScenarioPage> {
  final IssuerStore _issuerStore = Get.find();
  final ApiProvider _apiProvider = Get.find();

  static Color bgColor = WalletColor.white;
  static TextStyle textStyle = WalletFont.font_14();

  final TextEditingController _controller = TextEditingController();

  Set<VcType> selectedVcTypes;

  String get name => _controller.text;
  List<IssuerResponse> get issuers => _issuerStore.issuers;

  @override
  void initState() {
    super.initState();
    selectedVcTypes = <VcType>{};
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        title: '需验证凭证',
        withBottomBtn: true,
        bodyBackColor: bgColor,
        btnText: "确定并生成二维码",
        btnOnPressed: () => _handleVsSubmit(),
        child: ListView(
          children: <Widget>[
            Header(
                title: '从以下凭证提供方选择需要验证的凭证',
                textStyle: textStyle,
                bgColor: bgColor),
            Container(
                padding: const EdgeInsets.only(left: 50, right: 50),
                width: 270,
                height: 34,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _controller,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(3),
                    hintText: '请输入该场景名称',
                  ),
                )),
            ..._form,
          ],
        ));
  }

  List<Widget> get _form {
    if (issuers == null) {
      return <Widget>[];
    }

    final List<Widget> list = <Widget>[];
    for (final IssuerResponse issuer in issuers) {
      if (issuer.vcTypes.isEmpty) {
        continue;
      }
      list.add(_issuerVcGroup(issuer));
    }

    return list;
  }

  Widget _issuerVcGroup(IssuerResponse issuer) {
    final List<Widget> vcList = <Widget>[];

    for (final VcType vcType in issuer.vcTypes) {
      vcList.add(VcTypeCard(
          vcType: vcType,
          isSelected: selectedVcTypes.contains(vcType),
          onTap: () => _toggleVcType(vcType)));
    }

    return CardGroup(name: issuer.name, children: vcList);
  }

  void _toggleVcType(VcType vcType) {
    setState(() {
      if (selectedVcTypes.contains(vcType)) {
        selectedVcTypes.remove(vcType);
      } else {
        selectedVcTypes.add(vcType);
      }
    });
  }

  Future<void> _handleVsSubmit() async {
    final List<VcType> vcTypes = selectedVcTypes.toList();

    await _apiProvider.pathVerifier(name, vcTypes);
    Application.router.navigateTo(
        context, Routes.verificationScenarioQrPage,
        routeSettings: RouteSettings(arguments: name));
  }
}

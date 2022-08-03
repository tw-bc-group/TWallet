import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/application.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/models/issuer_response.dart';
import 'package:tw_wallet_ui/models/vc_type_response.dart';
import 'package:tw_wallet_ui/router/routers.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/ssi.dart';
import 'package:tw_wallet_ui/store/issuer_store.dart';
import 'package:tw_wallet_ui/widgets/card_group.dart';
import 'package:tw_wallet_ui/widgets/header.dart';
import 'package:tw_wallet_ui/widgets/hint_dialog.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/scan_icon.dart';
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

  late Set<VcType> selectedVcTypes;
  String? errorText;

  String get name => _controller.text;
  List<IssuerResponse> issuers = [];

  @override
  void initState() {
    super.initState();
    selectedVcTypes = <VcType>{};
    reload();
  }

  Future<void> reload() async {
    await _issuerStore.fetchIssuers();
    setState(() {
      issuers = _issuerStore.issuers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: '需验证凭证',
      withBottomBtn: true,
      bodyBackColor: bgColor,
      btnText: "确定并生成二维码",
      btnOnPressed: () => _handleVsSubmit(),
      errorText: errorText??"",
      appBarActions: <Widget>[
        ScanIcon(scanCallBack: _handleScanResult),
      ],
      child: ListView(
        children: <Widget>[
          Header(
            title: '从以下凭证提供方选择需要验证的凭证',
            textStyle: textStyle,
            bgColor: bgColor,
          ),
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
            ),
          ),
          ..._form,
        ],
      ),
    );
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
      vcList.add(
        VcTypeCard(
          vcType: vcType,
          isSelected: selectedVcTypes.contains(vcType),
          onTap: () => _toggleVcType(vcType),
        ),
      );
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

    if (vcTypes.isEmpty) {
      setState(() {
        errorText = "请选择VC类型";
      });
      return;
    }
    if (name.isEmpty) {
      setState(() {
        errorText = "请填写场景名称";
      });
      return;
    }

    setState(() {
      errorText = null;
    });

    try {
      await _apiProvider.patchVerifier(
        SsiService.getSelectDid(),
        name,
        vcTypes,
      );
      Application.router.navigateTo(
        context,
        Routes.verificationScenarioQrPage,
        routeSettings: RouteSettings(arguments: name),
      );
    } catch (err) {
      await hintDialogHelper(context, DialogType.error, "$err");
    }
  }

  Future<void> _handleScanResult(String scanResult) async {
    try {
      final op = await _apiProvider.verifierTravelBadgeVerify(
        SsiService.getSelectDid(),
        scanResult,
      );
      final res = op.first;
      if (res.statusCode! >= 200 && res.statusCode! < 300) {
        if (res.data['result']['overdue'] as String != 'FALSE') {
          await hintDialogHelper(
            context,
            DialogType.error,
            "验证失败",
            subText: "通行证已过期",
          );
          return;
        }
        if (res.data['result']['verify_signature'] as String != 'TRUE') {
          await hintDialogHelper(
            context,
            DialogType.error,
            "验证失败",
            subText: "验证签名失败",
          );
          return;
        }
        await hintDialogHelper(context, DialogType.success, "验证成功");
      } else {
        await hintDialogHelper(
          context,
          DialogType.error,
          "验证失败",
          subText: res.statusMessage!,
        );
      }
    } catch (err) {
      printError(info: "$err");
      await hintDialogHelper(context, DialogType.error, "验证失败");
    }
  }
}

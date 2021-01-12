import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/ssi.dart';
import 'package:tw_wallet_ui/widgets/header.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/qr_card.dart';

class VerificationScenarioQrPage extends StatelessWidget {
  final String name;

  final ApiProvider _apiProvider = Get.find<ApiProvider>();

  VerificationScenarioQrPage({this.name});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        child: Column(children: <Widget>[
      Header(title: name),
      QrCard(data: _apiProvider.verifiersVcQrPath(SsiService.getSelectDid())),
    ]));
  }
}

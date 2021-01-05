import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/widgets/header.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/qr_card.dart';

const String verifierUrl = "https://wallet.cn.blockchain.thoughtworks.cn/v2/verifier/1/vc";

@immutable
class VerificationScenarioQrPage extends StatelessWidget {
  final String name;


  const VerificationScenarioQrPage({ this.name });

  @override
  Widget build(BuildContext context) {

    return CommonLayout(
        child: Column(
            children: <Widget>[
              Header(title: name),
              const QrCard(data: verifierUrl)
            ]
        )
    );
  }

}

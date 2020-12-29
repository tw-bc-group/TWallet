import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/font.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/qr_card.dart';

class PassPage extends StatelessWidget {
  PassPage();

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        child: Column(
            children: <Widget>[_header, QrCard(data: "Demo Passcode", remainSeconds: 60,)]));
  }

  Widget get _header {
    return Container(
      height: 70,
      color: WalletColor.primary,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: const <Widget>[
          Center(
            child: Text("请出示用于\n【某医院患者通行】",
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
}

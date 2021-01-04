import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/models/vc_pass.dart';
import 'package:tw_wallet_ui/store/vc_store.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';
import 'package:tw_wallet_ui/widgets/qr_card.dart';

class PassPage extends StatelessWidget {
  PassPage();

  final VcStore _store = Get.find();

  VcPass get vcPass => _store.vcPass;

  @override
  Widget build(BuildContext context) {

    return CommonLayout(
        child: Column(
            children: <Widget>[
              if (vcPass.name != null) _header(vcPass.name ?? "XXX"),
              if (vcPass.token != null) QrCard(data: vcPass.token,)]));
  }

  Widget _header(String passName) {
    return Container(
      height: 70,
      color: WalletColor.primary,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Center(
            child: Text("请出示用于\n【$passName】",
                textAlign: TextAlign.center,
                style: const TextStyle(
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

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

    print(vcPass.toJson());
    return CommonLayout(
        child: Column(
            children: <Widget>[
              if (vcPass.name != null) _header,
              if (vcPass.token != null) QrCard(data: vcPass.token,)]));
  }

  Widget get _header {
    return Container(
      height: 70,
      color: WalletColor.primary,
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: const <Widget>[
          Center(
            child: Text("请出示用于\n【地坛医院】",
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';

class QrCard extends StatelessWidget {
  final String data;
  final int remainSeconds;

  const QrCard({
    @required this.data,
    this.remainSeconds
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: WalletColor.white),
      margin: const EdgeInsets.only(left: 18, right: 18, top: 18),
      padding: const EdgeInsets.only(top: 60, bottom: 60, left: 60, right: 60),
      child: Column(children: [
        QrImage(data: data),
        if (remainSeconds != null) Text("${remainSeconds}s")]),
    );
  }
}

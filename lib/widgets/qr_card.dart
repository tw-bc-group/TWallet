import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/widgets/countdown_timer.dart';
import 'package:tw_wallet_ui/widgets/error_row.dart';

class QrCard extends StatefulWidget {
  const QrCard({
    Key key,
    @required this.data,
    this.before,
  }) : super(key: key);

  final String data;
  final DateTime before;

  @override
  _QrCardState createState() => _QrCardState();
}

class _QrCardState extends State<QrCard> {
  bool isExpired = false;

  @override
  void initState() {
    super.initState();
  }

  void handleAtExpiration() {
    setState(() {
      isExpired = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final DateTime before = widget.before;

    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: WalletColor.white),
      margin: const EdgeInsets.only(left: 18, right: 18, top: 18),
      padding: const EdgeInsets.only(top: 60, bottom: 60, left: 60, right: 60),
      child: Column(children: [
        QrImage(
            data: widget.data,
            foregroundColor: isExpired ? WalletColor.red : WalletColor.black),
        if (before != null && !isExpired)
          CountdownTimer(before: before, atExpiration: handleAtExpiration),
        if (before != null && isExpired)
          ErrorRowWidget(
              errorText: "已于${DateFormat('yyyy-MM-dd kk:mm').format(before)}过期")
      ]),
    );
  }
}

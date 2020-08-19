import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/ble/ble_periphery.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class Payee extends StatefulWidget {
  final String name;
  final double amount;

  const Payee({Key key, this.name, this.amount}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PayeeState();
}

class _PayeeState extends State<Payee> {
  final _blePeriphery = BlePeriphery();
  final RxString _progress = RxString('等待收款');

  @override
  void initState() {
    super.initState();
    _blePeriphery.startAdvertising('${widget.name}收款${widget.amount}');
    _blePeriphery.readStream().listen((data) {
      _progress.value = '${_progress.value}\n${String.fromCharCodes(data)}';
    });
  }

  @override
  void dispose() {
    _blePeriphery.stopAdvertising();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
        bodyBackColor: WalletColor.white,
        title: '收款中',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Obx(() => Text(_progress.value))),
        ));
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/ble/ble_periphery.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import '../command.dart';

class Payment extends StatefulWidget {
  final String name;
  final double amount;

  const Payment({Key key, this.name, this.amount}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _blePeriphery = BlePeriphery();
  final RxString _hintText = RxString('等待收款...');

  void _appendProgress(String text) {
    _hintText.value += '\n$text';
  }

  @override
  void initState() {
    super.initState();
    _blePeriphery.startAdvertising('${widget.name}收款${widget.amount}');
    _blePeriphery.readStream().listen((data) {
      final String command = String.fromCharCodes(data['data'] as Uint8List);
      if (command.startsWith(askAmount)) {
        _appendProgress('接收到付款请求...');
        _blePeriphery.sendData(data['device'] as String,
            Uint8List.fromList('$answerAmount:${widget.amount}'.codeUnits));
      } else if (command.startsWith(askPayment)) {
        _appendProgress('开始收款...');
        _blePeriphery.sendData(data['device'] as String,
            Uint8List.fromList('$answerPayment:${widget.amount}'.codeUnits));
        _appendProgress('收款成功...');
      }
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
        title: '收款 ${widget.amount}',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child:
                Obx(() => Text(_hintText.value, textAlign: TextAlign.center)),
          ),
        ));
  }
}

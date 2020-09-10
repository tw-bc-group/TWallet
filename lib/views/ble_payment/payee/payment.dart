import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/ble/ble_periphery.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/models/offline_tx/offline_tx.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/tx_store.dart';
import 'package:tw_wallet_ui/views/ble_payment/payee/session.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class Payment extends StatefulWidget {
  final String name;
  final int amount;
  final String address;

  const Payment({Key key, this.name, this.address, this.amount})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final RxString _hintText = RxString('');
  final Map<String, Session> _sessions = {};
  final BlePeriphery _blePeriphery = BlePeriphery();
  final OfflineTxStore _txStore = Get.find<OfflineTxStore>();

  Widget _buildButton() {
    if (_hintText.value == '收款成功') {
      return WalletTheme.button(text: '结束收款', onPressed: () => Get.back());
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    super.initState();

    _blePeriphery.startAdvertising('${widget.name}收款${widget.amount}');

    _blePeriphery.stateStream().listen((event) {
      final String peer = event['device'] as String;

      switch (BleCentralState.fromInt(event['state'] as int)) {
        case BleCentralState.connected:
          _sessions[peer] =
              Session(_blePeriphery, peer, widget.address, widget.amount);
          break;

        case BleCentralState.disconnected:
          _sessions.remove(peer);
          break;

        default:
          break;
      }
    });

    _blePeriphery.dataStream().listen((event) {
      final String peer = event['device'] as String;
      final Uint8List payload = event['data'] as Uint8List;
      if (!_sessions.containsKey(peer)) {
        _sessions[peer] =
            Session(_blePeriphery, peer, widget.address, widget.amount);
      }
      try {
        _sessions[peer].onData(
            payload, (state) => _hintText.value += '\n$state', (TxReceive tx) {
          _txStore.addOne(tx);
        });
      } catch (_) {
        _sessions.remove(peer);
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
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Obx(
                      () => Text(_hintText.value, textAlign: TextAlign.center)),
                ),
              ),
              Obx(() => _buildButton()),
            ],
          ),
        ));
  }
}

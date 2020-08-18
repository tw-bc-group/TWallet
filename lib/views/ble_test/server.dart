import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/ble/ble_periphery.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

class BleServer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BleServerState();
}

class _BleServerState extends State<BleServer> {
  final _blePeriphery = BlePeriphery();
  final _sendController = TextEditingController();
  final _receiveController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _blePeriphery.startAdvertising();
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
        title: 'ble-test',
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Expanded(child: TextField(controller: _sendController)),
              WalletTheme.button(
                  text: '发送',
                  onPressed: () {
                    if (_sendController.text.isNotEmpty) {
                      _blePeriphery.sendData();
                      _sendController.clear();
                    }
                  })
            ]),
            Expanded(
                child: TextField(
                    readOnly: true,
                    maxLines: null,
                    controller: _receiveController))
          ]),
        ));
  }
}

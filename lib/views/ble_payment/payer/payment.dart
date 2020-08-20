import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import 'payee.dart';

class Payment extends StatefulWidget {
  final Payee _bleDevice;

  const Payment(this._bleDevice);

  @override
  State<StatefulWidget> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  Characteristic _readCharacteristic;
  Characteristic _writeCharacteristic;
  final Rx<PeripheralConnectionState> _connectionState =
      Rx(PeripheralConnectionState.disconnected);
  final TextEditingController _sendController = TextEditingController();
  final TextEditingController _receiveController = TextEditingController();

  Future<bool> discovery() async {
    await widget._bleDevice.peripheral.discoverAllServicesAndCharacteristics();

    final Service service = await widget._bleDevice.peripheral.services().then(
        (services) => services.firstWhere((service) =>
            service.uuid == "36efb2e4-8711-4852-b339-c6b5dac518e0"));

    final List<Characteristic> characteristics =
        await service.characteristics();

    _readCharacteristic = characteristics.firstWhere((characteristic) =>
        characteristic.uuid == "0ac637b0-9c14-4741-8f9f-b0baae77d0b4");

    _writeCharacteristic = characteristics.firstWhere((characteristic) =>
        characteristic.uuid == "4fec0357-2493-4901-b1a2-9e2ec21b9676");

    if (_readCharacteristic == null || _writeCharacteristic == null) {
      return false;
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    widget._bleDevice.connect();
  }

  @override
  void dispose() {
    widget._bleDevice.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => CommonLayout(
        title: widget._bleDevice.name,
        bodyBackColor: WalletColor.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Expanded(child: TextField(controller: _sendController)),
              WalletTheme.button(
                  text: '发送',
                  onPressed: _connectionState.value ==
                          PeripheralConnectionState.connected
                      ? () async {
                          if (_sendController.text.isNotEmpty) {
                            _writeCharacteristic
                                .write(
                                    Uint8List.fromList(
                                        _sendController.text.codeUnits),
                                    false)
                                .then((_) => _sendController.clear());
                          }
                        }
                      : null),
            ]),
            Expanded(
                child: TextField(
                    readOnly: true,
                    maxLines: null,
                    controller: _receiveController)),
            StreamBuilder<PeripheralConnectionState>(
                stream: widget._bleDevice.connectionState,
                initialData: PeripheralConnectionState.disconnected,
                builder: (context, snapshot) {
                  if (snapshot.data == PeripheralConnectionState.connected) {
                    discovery().then((success) {
                      if (!success) {
                        widget._bleDevice
                            .disconnect()
                            .then((_) => widget._bleDevice.connect());
                      }
                    });
                  }
                  _connectionState.value = snapshot.data;
                  return Text(_connectionState.value.toString());
                })
          ]),
        )));
  }
}

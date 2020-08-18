import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/theme/color.dart';
import 'package:tw_wallet_ui/common/theme/index.dart';
import 'package:tw_wallet_ui/widgets/layouts/common_layout.dart';

import 'ble_device.dart';

class DeviceDetail extends StatefulWidget {
  final BleDevice _bleDevice;

  const DeviceDetail(this._bleDevice);

  @override
  State<StatefulWidget> createState() => _DeviceDetailState();
}

class _DeviceDetailState extends State<DeviceDetail> {
  final Rx<PeripheralConnectionState> _connectionState =
      Rx(PeripheralConnectionState.disconnected);
  final TextEditingController _sendController = TextEditingController();
  final TextEditingController _receiveController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget._bleDevice.connect();
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
                            await widget._bleDevice.peripheral
                                .discoverAllServicesAndCharacteristics();

                            final Service service = await widget
                                ._bleDevice.peripheral
                                .services()
                                .then((services) => services.firstWhere(
                                    (service) =>
                                        service.uuid ==
                                        "36efb2e4-8711-4852-b339-c6b5dac518e0"));

                            final List<Characteristic> characteristics =
                                await service.characteristics();
                            final Characteristic characteristic =
                                characteristics.firstWhere((characteristic) =>
                                    characteristic.uuid ==
                                    "4fec0357-2493-4901-b1a2-9e2ec21b9676");

                            characteristic
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
                  _connectionState.value = snapshot.data;
                  return Text(_connectionState.value.toString());
                })
          ]),
        )));
  }
}

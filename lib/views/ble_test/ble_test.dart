import 'package:flutter/material.dart';
import 'package:tw_wallet_ui/ble/ble_periphery.dart';

class BleTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BleTestState();
}

class _BleTestState extends State<BleTest> {
  final _blePeriphery = BlePeriphery();

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
    return const Center(
      child: Text('BleTest'),
    );
  }
}

import 'package:flutter/services.dart';

class BlePeriphery {
  static BlePeriphery _instance;
  final MethodChannel _methodChannel;
  int nextListenerId = 1;

  factory BlePeriphery() {
    if (_instance == null) {
      const MethodChannel _methodChannel =
      MethodChannel('matrix.ble_periphery/method');
      _instance = BlePeriphery.private(_methodChannel);
    }
    return _instance;
  }

  BlePeriphery.private(this._methodChannel);

  Future<void> startAdvertising() {
    return _methodChannel.invokeMethod('startAdvertising');
  }

  Future<void> stopAdvertising() {
    return _methodChannel.invokeMethod('stopAdvertising');
  }
}

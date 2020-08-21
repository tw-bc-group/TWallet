import 'dart:typed_data';

import 'package:flutter/services.dart';

class BlePeriphery {
  static BlePeriphery _instance;
  final MethodChannel _methodChannel;
  final EventChannel _eventChannel;

  factory BlePeriphery() {
    if (_instance == null) {
      const MethodChannel _methodChannel =
          MethodChannel('matrix.ble_periphery/method');
      const EventChannel _eventChannel =
          EventChannel('matrix.ble_periphery/event');

      _instance = BlePeriphery.private(_methodChannel, _eventChannel);
    }
    return _instance;
  }

  Stream<Map<String, dynamic>> readStream() {
    return _eventChannel.receiveBroadcastStream().asyncMap((event) {
      return (event as Map<dynamic, dynamic>)
          .map((key, value) => MapEntry(key as String, value));
    });
  }

  BlePeriphery.private(this._methodChannel, this._eventChannel);

  Future<void> startAdvertising(String name) {
    return _methodChannel.invokeMethod('startAdvertising', name);
  }

  Future<void> stopAdvertising() {
    return _methodChannel.invokeMethod('stopAdvertising');
  }

  Future<void> sendData(String device, Uint8List data) {
    return Future.delayed(const Duration(milliseconds: 500)).then((_) =>
        _methodChannel
            .invokeMethod('sendData', {'device': device, 'data': data}));
  }
}

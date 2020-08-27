import 'dart:typed_data';

import 'package:flutter/services.dart';

class BlePeriphery {
  static BlePeriphery _instance;
  final EventChannel _dataChannel;
  final EventChannel _stateChannel;
  final MethodChannel _methodChannel;

  factory BlePeriphery() {
    if (_instance == null) {
      const EventChannel _dataChannel =
          EventChannel('matrix.ble_periphery/data');
      const EventChannel _stateChannel =
          EventChannel('matrix.ble_periphery/state');
      const MethodChannel _methodChannel =
      MethodChannel('matrix.ble_periphery/method');

      _instance =
          BlePeriphery.private(_methodChannel, _stateChannel, _dataChannel);
    }
    return _instance;
  }

  BlePeriphery.private(
      this._methodChannel, this._stateChannel, this._dataChannel);

  Stream<Map<String, String>> stateStream() {
    return _stateChannel.receiveBroadcastStream().asyncMap((state) =>
        (state as Map<dynamic, dynamic>)
            .map((key, value) => MapEntry(key as String, value as String)));
  }

  Stream<Map<String, dynamic>> dataStream() {
    return _dataChannel.receiveBroadcastStream().asyncMap((data) =>
        (data as Map<dynamic, dynamic>)
            .map((key, value) => MapEntry(key as String, value)));
  }

  Future<void> startAdvertising(String name) {
    return _methodChannel.invokeMethod('startAdvertising', name);
  }

  Future<void> stopAdvertising() {
    return _methodChannel.invokeMethod('stopAdvertising');
  }

  Future<void> sendData(String device, Uint8List data) {
    return _methodChannel
        .invokeMethod('sendData', {'device': device, 'data': data});
  }
}

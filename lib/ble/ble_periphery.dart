import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter/services.dart';

part 'ble_periphery.g.dart';

class BleCentralState extends EnumClass {
  static Serializer<BleCentralState> get serializer =>
      _$bleCentralStateSerializer;

  static const BleCentralState connected = _$connected;
  static const BleCentralState disconnected = _$disconnected;

  static BuiltSet<BleCentralState> get values => _$values;

  static BleCentralState valueOf(String name) => _$valueOf(name);

  static BleCentralState fromInt(int state) {
    switch (state) {
      case 0:
        return BleCentralState.disconnected;
      case 2:
        return BleCentralState.connected;
      default:
        throw Exception('unknown ble central state of $state');
    }
  }

  const BleCentralState._(String name) : super(name);
}

class BlePeriphery {
  final EventChannel _dataChannel;
  final EventChannel _stateChannel;
  final MethodChannel _methodChannel;

  factory BlePeriphery() {
    const EventChannel dataChannel = EventChannel('matrix.ble_periphery/data');
    const EventChannel stateChannel =
        EventChannel('matrix.ble_periphery/state');
    const MethodChannel methodChannel =
        MethodChannel('matrix.ble_periphery/method');
    return BlePeriphery.private(methodChannel, stateChannel, dataChannel);
  }

  BlePeriphery.private(
    this._methodChannel,
    this._stateChannel,
    this._dataChannel,
  );

  Stream<Map<String, dynamic>> stateStream() {
    return _stateChannel.receiveBroadcastStream().asyncMap(
          (state) => (state as Map<dynamic, dynamic>)
              .map((key, value) => MapEntry(key as String, value)),
        );
  }

  Stream<Map<String, dynamic>> dataStream() {
    return _dataChannel.receiveBroadcastStream().asyncMap(
          (data) => (data as Map<dynamic, dynamic>)
              .map((key, value) => MapEntry(key as String, value)),
        );
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

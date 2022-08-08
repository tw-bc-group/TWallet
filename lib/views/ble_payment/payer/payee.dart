import 'package:collection/collection.dart';
import 'package:flutter_ble_lib_ios_15/flutter_ble_lib.dart';

class Payee {
  final Peripheral peripheral;
  final String name;
  final DeviceCategory category;

  String get id => peripheral.identifier;

  Stream<PeripheralConnectionState> get connectionState =>
      peripheral.observeConnectionState(completeOnDisconnect: true);

  Payee(ScanResult scanResult)
      : peripheral = scanResult.peripheral,
        name = scanResult.name,
        category = scanResult.category;

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) =>
      other is Payee &&
      name != null &&
      other.name != null &&
      compareAsciiLowerCase(name, other.name) == 0 &&
      id == other.id;

  @override
  String toString() {
    return 'BleDevice{name: $name}';
  }

  Future<bool> isConnected() {
    return peripheral.isConnected();
  }

  Future<void> connect() {
    return peripheral.connect(requestMtu: 512, refreshGatt: true);
  }

  Future<void> disconnect() {
    return peripheral.disconnectOrCancelConnection();
  }
}

enum DeviceCategory { sensorTag, hex, other }

extension on ScanResult {
  String get name =>
      peripheral.name ?? advertisementData.localName ?? "Unknown";

  DeviceCategory get category {
    if (name == "SensorTag") {
      return DeviceCategory.sensorTag;
    } else if (name != null && name.startsWith("Hex")) {
      return DeviceCategory.hex;
    } else {
      return DeviceCategory.other;
    }
  }
}

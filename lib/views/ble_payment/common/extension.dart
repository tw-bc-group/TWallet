import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_ble_lib_ios_15/flutter_ble_lib.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/symm_encrypt.dart';

extension CharacteristicExtension on Characteristic {
  Future<String> receiveString() {
    return read().then((data) {
      return data;
    }).then((Uint8List data) => String.fromCharCodes(data));
  }

  Future<Command> receiveCommand() {
    return receiveString()
        .then((data) => json.decode(data))
        .then((json) => Command.fromJson(json));
  }

  Future<void> sendCommand(Command command) {
    return write(command.encode(), false);
  }

  Future<Command> receiveEncryptedCommand(SymmEncrypt encrypter) {
    return read().then(
      (Uint8List data) => Command.fromJson(
        json.decode(String.fromCharCodes(encrypter.decrypt(data))),
      ),
    );
  }

  Future<void> sendEncryptedCommand(SymmEncrypt encrypter, Command command) {
    return write(encrypter.encrypt(command.encode()), false);
  }
}

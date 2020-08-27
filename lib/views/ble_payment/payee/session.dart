import 'dart:convert';
import 'dart:typed_data';

import 'package:crypton/crypton.dart';
import 'package:tw_wallet_ui/ble/ble_periphery.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/symm_encrypt.dart';

class Session {
  final String peer;
  final String address;
  final double amount;
  final BlePeriphery peripheral;

  RSAKeypair keyPair;
  SymmEncrypt encrypter;

  Session(this.peripheral, this.peer, this.address, this.amount);

  Future<void> _sendCommand(Command command) {
    Uint8List data;
    final Uint8List encoded = command.encode();

    if (encrypter != null) {
      data = encrypter.encrypt(encoded);
    } else {
      data = encoded;
    }

    return peripheral.sendData(peer, data);
  }

  Future<void> onData(Uint8List data) async {
    Uint8List cmdData;

    if (encrypter != null) {
      cmdData = encrypter.decrypt(data);
    } else {
      cmdData = data;
    }

    final Command command =
        Command.fromJson(json.decode(String.fromCharCodes(cmdData)));

    switch (command.type) {
      case CommandType.getPubKey:
        keyPair = RSAKeypair.fromRandom();
        peripheral.sendData(
            peer,
            Command.build(CommandType.setPubKey,
                    param: keyPair.publicKey.toString())
                .encode());
        break;

      case CommandType.setAesKey:
        final String aesKey = keyPair.privateKey.decrypt(command.param);
        encrypter = SymmEncrypt(aesKey, keyPair.publicKey.toString());
        keyPair = null;
        _sendCommand(Command.build(
          CommandType.ok,
        ));
        break;

      case CommandType.getTxInfo:
        _sendCommand(
            Command.build(CommandType.setTxInfo, param: '$address:$amount'));
        break;
    }
    return;
  }
}

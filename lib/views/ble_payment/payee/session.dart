import 'dart:convert';
import 'dart:typed_data';

import 'package:crypton/crypton.dart';
import 'package:tw_wallet_ui/ble/ble_periphery.dart';
import 'package:tw_wallet_ui/models/eth_tx_info/eth_tx_info.dart';
import 'package:tw_wallet_ui/service/rlp.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/symm_encrypt.dart';
import 'package:web3dart/crypto.dart';

typedef OnStateUpdate = void Function(String state);

class Session {
  final String peer;
  final String address;
  final double amount;
  final BlePeriphery peripheral;

  RSAKeypair keyPair;
  String fromAddress;
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

  Future<void> onData(Uint8List data, OnStateUpdate onStateUpdate) async {
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
        onStateUpdate('对端请求会话公钥');
        keyPair = RSAKeypair.fromRandom();
        peripheral
            .sendData(
                peer,
                Command.build(CommandType.setPubKey,
                        param: keyPair.publicKey.toString())
                    .encode())
            .then((_) => onStateUpdate('发送随机会话公钥'));
        break;

      case CommandType.setAesKey:
        onStateUpdate('收到会话加密密钥');
        final List<String> aesParam =
            keyPair.privateKey.decrypt(command.param).split(' ');
        encrypter = SymmEncrypt(aesParam[0], aesParam[1]);
        keyPair = null;
        _sendCommand(Command.build(CommandType.setAesOk))
            .then((_) => onStateUpdate('回复会话加密密钥成功'));
        break;

      case CommandType.getTxInfo:
        onStateUpdate('收到交易信息请求');
        fromAddress = command.param;
        _sendCommand(
                Command.build(CommandType.setTxInfo, param: '$address:$amount'))
            .then((_) => onStateUpdate('发送交易信息'));
        break;

      case CommandType.setRawTx:
        onStateUpdate('收款验证...');
        final EthTxInfo txInfo =
            EthTxInfo.fromDecodedRlp(decode(hexToBytes(command.param)));
        if (txInfo.to != address) {
          onStateUpdate('验证失败...');
        } else {
          _sendCommand(Command.build(CommandType.setRawTxOk,
                  param: '$address:$amount'))
              .then((_) => onStateUpdate('收款成功'));
        }
        break;
    }
    return;
  }
}

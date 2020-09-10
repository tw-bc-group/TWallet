import 'dart:convert';
import 'dart:typed_data';

import 'package:crypton/crypton.dart';
import 'package:get/get.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/ble/ble_periphery.dart';
import 'package:tw_wallet_ui/models/dcep/dcep.dart';
import 'package:tw_wallet_ui/models/eth_tx_info/eth_tx_info.dart';
import 'package:tw_wallet_ui/models/offline_tx/offline_tx.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/service/rlp.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/symm_encrypt.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

typedef OnStateUpdate = void Function(String state);
typedef OnSuccess = void Function(TxReceive tx);

class Session {
  final String peer;
  final String address;
  final int amount;
  final BlePeriphery peripheral;

  RSAKeypair keyPair;
  SymmEncrypt encrypter;
  int receivedAmount = 0;
  List<String> dcepList = [];
  List<TxReceive> txReceivedList = [];
  String fromAddress, fromPublicKey;

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

  Future<void> onData(
      Uint8List data, OnStateUpdate onStateUpdate, OnSuccess onSuccess) async {
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
        final List<String> fields = command.param.split(' ');
        fromAddress = fields[0];
        fromPublicKey = fields[1];
        _sendCommand(
                Command.build(CommandType.setTxInfo, param: '$address:$amount'))
            .then((_) => onStateUpdate('发送交易信息'));
        break;

      case CommandType.setDcep:
        final List<String> fields = command.param.split(' ');
        final int index = int.parse(fields[0]);
        final int count = int.parse(fields[1]);
        final Dcep dcep = Dcep.fromJson(json.decode(fields[2]));

        bool verifyOk = false;

        dcepList.add(dcep.sn);

        onStateUpdate('验证款项...');

        if (dcep.verify()) {
          receivedAmount += dcep.amount;
          if (index == count) {
            if (receivedAmount == amount * 100) {
              verifyOk = true;
            }
          }
        }

        if (verifyOk) {
          _sendCommand(Command.build(
            CommandType.setDcepOk,
          )).then((_) => onStateUpdate('验证款项成功'));
        } else {
          _sendCommand(Command.build(
            CommandType.setDcepFail,
          )).then((_) => onStateUpdate('验证款项失败'));
        }
        break;

      case CommandType.setRawTx:
        onStateUpdate('收款交易验证...');

        final EthTxInfo ethTxInfo =
            EthTxInfo.fromDecodedRlp(decode(hexToBytes(command.param)));

        final List<dynamic> params = Get.find<ContractService>()
            .nftTokenContract
            .decodeParameters('safeTransferFrom', ethTxInfo.data);

        final Optional<String> recoverPubKey = ethTxInfo.recoverPublicKey();

        final String decompressedPubKey = bytesToHex(
            decompressPublicKey(hexToBytes(fromPublicKey)).sublist(1));

        final String dcepSn =
            String.fromCharCodes(intToBytes(params[2] as BigInt));

        bool verifyOk = false;

        dcepList.remove(dcepSn);

        if (recoverPubKey == Optional.of(decompressedPubKey) &&
            (params[0] as EthereumAddress).toString().toLowerCase() ==
                fromAddress.toLowerCase() &&
            (params[1] as EthereumAddress).toString().toLowerCase() ==
                address.toLowerCase()) {
          txReceivedList.add(TxReceive((builder) => builder
            ..from = fromAddress
            ..publicKey = fromPublicKey
            ..tx = command.param));
          verifyOk = true;
        }

        if (!verifyOk) {
          _sendCommand(Command.build(
            CommandType.setRawTxFail,
          )).then((_) => onStateUpdate('交易验证不通过，收款失败'));
        } else if (dcepList.isEmpty) {
          for (final TxReceive txReceive in txReceivedList) {
            onSuccess(txReceive);
          }
          _sendCommand(Command.build(CommandType.setRawTxOk,
                  param: '$address:$amount'))
              .then((_) => onStateUpdate('收款成功'));
        }
        break;
    }
    return;
  }
}

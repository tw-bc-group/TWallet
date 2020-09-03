import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypton/crypton.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:get/get.dart';
import 'package:optional/optional.dart';
import 'package:random_string/random_string.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/extension.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/symm_encrypt.dart';

typedef WaitOnSignPayment = Future<Optional<String>> Function(
    String toAddress, double amount);

typedef OnStateUpdate = void Function(SessionState state);

enum SessionState {
  initial,
  waitPublicKeyAnswer,
  waitAesKeyAnswer,
  waitTxInfo,
  waitUserConfirm,
  waitReceipt,
  success,
}

extension SessionStateExtension on SessionState {
  String description() {
    switch (this) {
      case SessionState.initial:
        return '开始付款';
      case SessionState.waitPublicKeyAnswer:
        return '获取随机公钥';
      case SessionState.waitAesKeyAnswer:
        return '会话密钥协商成功';
      case SessionState.waitTxInfo:
        return '获取交易信息';
      case SessionState.waitUserConfirm:
        return '等待用户确认付款';
      case SessionState.waitReceipt:
        return '等待付款成功回执';
      case SessionState.success:
        return '付款成功';
      default:
        return '未知状态';
    }
  }
}

class Session {
  final String address;
  final Characteristic _readCharacteristic;
  final Characteristic _writeCharacteristic;
  final Queue<Completer> _readQueue = Queue();
  final Rx<SessionState> _state = Rx(SessionState.initial);

  SymmEncrypt _encrypter;

  Session(this.address, this._readCharacteristic, this._writeCharacteristic);

  Future<void> _sendCommand(Command command, SessionState newState) {
    Future sendFuture;
    _readQueue.add(Completer());
    if (_encrypter != null) {
      sendFuture =
          _writeCharacteristic.sendEncryptedCommand(_encrypter, command);
    } else {
      sendFuture = _writeCharacteristic.sendCommand(command);
    }

    return Future.delayed(const Duration(milliseconds: 100))
        .then((_) => sendFuture.then((_) {
              _state.value = newState;
              _readQueue.first.complete();
            }));
  }

  Future<Command> _checkCommand(Command command) {
    bool matched = true;
    switch (_state.value) {
      case SessionState.waitPublicKeyAnswer:
        if (command.type != CommandType.setPubKey) {
          matched = false;
        } else if (command.param.isEmpty) {
          throw Exception('The public key params is empty');
        }
        break;

      case SessionState.waitAesKeyAnswer:
        if (command.type != CommandType.setAesOk) {
          matched = false;
        }
        break;

      case SessionState.waitTxInfo:
        if (command.type != CommandType.setTxInfo) {
          matched = false;
        }
        break;

      case SessionState.waitReceipt:
        if (command.type != CommandType.setRawTxOk) {
          matched = false;
        }
        break;

      default:
        break;
    }

    if (!matched) {
      throw Exception('state $_state and command $command mismatch');
    }

    return Future.value(command);
  }

  Future<void> run(
      WaitOnSignPayment onSignPayment, OnStateUpdate onStateUpdate) async {
    _state.listen((newState) => onStateUpdate(newState));

    _readCharacteristic.monitor().listen((data) async {
      await _readQueue.removeFirst().future;

      Uint8List payload = data;

      if (_encrypter != null) {
        payload = _encrypter.decrypt(data);
      }

      final Command command =
          Command.fromJson(json.decode(String.fromCharCodes(payload)));

      _checkCommand(command);

      switch (_state.value) {
        case SessionState.waitPublicKeyAnswer:
          final String aesKey = randomString(16);
          final String iv = randomString(16);
          _sendCommand(
                  Command.build(CommandType.setAesKey,
                      param: RSAPublicKey.fromString(command.param)
                          .encrypt('$aesKey $iv')),
                  SessionState.waitAesKeyAnswer)
              .then((_) => _encrypter = SymmEncrypt(aesKey, iv));
          break;

        case SessionState.waitAesKeyAnswer:
          _sendCommand(Command.build(CommandType.getTxInfo, param: address),
              SessionState.waitTxInfo);
          break;

        case SessionState.waitTxInfo:
          final List<String> fields = command.param.split(':');
          print('fields: $fields');
          _state.value = SessionState.waitUserConfirm;
          (await onSignPayment(fields[0], double.parse(fields[1])))
              .ifPresent((signedTx) {
            _sendCommand(Command.build(CommandType.setRawTx, param: signedTx),
                SessionState.waitReceipt);
          });
          break;

        case SessionState.waitReceipt:
          _state.value = SessionState.success;
          break;

        default:
          break;
      }
    });

    _sendCommand(
        Command.build(CommandType.getPubKey), SessionState.waitPublicKeyAnswer);

    return;
  }
}

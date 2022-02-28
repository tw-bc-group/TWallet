import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:crypton/crypton.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:get/get.dart';
import 'package:optional/optional.dart';
import 'package:random_string/random_string.dart';
import 'package:tw_wallet_ui/models/offline_tx/offline_tx.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/extension.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/symm_encrypt.dart';

typedef WaitOnSignPayment = Future<Optional<List<TxSend>>> Function(
    String toAddress, int amount);

typedef OnStateUpdate = void Function(SessionState state);

enum SessionState {
  initial,
  waitPublicKeyAnswer,
  waitAesKeyAnswer,
  waitTxInfo,
  waitUserConfirm,
  waitDcepAnswer,
  waitReceipt,
  success,
  fail,
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
      case SessionState.fail:
        return '付款失败';
      default:
        return '未知状态';
    }
  }
}

class Session {
  final String? address;
  final String? publicKey;
  final Characteristic? _readCharacteristic;
  final Characteristic? _writeCharacteristic;
  final Queue<Completer> _readQueue = Queue();
  final Rx<SessionState> _state = Rx(SessionState.initial);

  List<TxSend>? _txList;
  SymmEncrypt? _encrypter;

  Session(this.address, this.publicKey, this._readCharacteristic,
      this._writeCharacteristic);

  Future<void> _sendCommand(Command command, SessionState newState) {
    Future sendFuture;

    final Completer completer = Completer();

    _readQueue.add(completer);

    if (_encrypter != null) {
      sendFuture =
          _writeCharacteristic!.sendEncryptedCommand(_encrypter!, command);
    } else {
      sendFuture = _writeCharacteristic!.sendCommand(command);
    }

    return Future.delayed(const Duration(milliseconds: 100)).then(
      (_) => sendFuture.then((_) {
        _state.value = newState;
        completer.complete();
      }),
    );
  }

  Future<Command> _checkCommand(Command command) {
    bool matched = true;
    switch (_state.value) {
      case SessionState.waitPublicKeyAnswer:
        if (command.type != CommandType.setPubKey) {
          matched = false;
        } else if (command.param!.isEmpty) {
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

      case SessionState.waitDcepAnswer:
        if (command.type != CommandType.setDcepOk &&
            command.type != CommandType.setDcepFail) {
          matched = false;
        }
        break;

      case SessionState.waitReceipt:
        if (command.type != CommandType.setRawTxOk &&
            command.type != CommandType.setRawTxFail) {
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

    _readCharacteristic!.monitor().listen((data) async {
      await _readQueue.first.future.then((_) => _readQueue.removeFirst());

      Uint8List payload = data;

      if (_encrypter != null) {
        payload = _encrypter!.decrypt(data);
      }

      final Command command =
          Command.fromJson(json.decode(String.fromCharCodes(payload)));

      _checkCommand(command);

      switch (_state.value) {
        case SessionState.waitPublicKeyAnswer:
          final String aesKey = randomString(16);
          final String iv = randomString(16);
          _sendCommand(
            Command.build(
              CommandType.setAesKey,
              param: RSAPublicKey.fromString(command.param!)
                  .encrypt('$aesKey $iv'),
            ),
            SessionState.waitAesKeyAnswer,
          ).then((_) => _encrypter = SymmEncrypt(aesKey, iv));
          break;

        case SessionState.waitAesKeyAnswer:
          _sendCommand(
            Command.build(
              CommandType.getTxInfo,
              param: '$address $publicKey',
            ),
            SessionState.waitTxInfo,
          );
          break;

        case SessionState.waitTxInfo:
          final List<String> fields = command.param!.split(':');
          _state.value = SessionState.waitUserConfirm;
          (await onSignPayment(fields[0], int.parse(fields[1])))
              .ifPresent((txList) {
            _txList = txList;
            txList.asMap().forEach((index, tx) {
              _sendCommand(
                Command.build(
                  CommandType.setDcep,
                  param:
                      '${index + 1} ${txList.length} ${json.encode(tx.dcep.toJson())}',
                ),
                SessionState.waitDcepAnswer,
              );
            });
          });
          break;

        case SessionState.waitDcepAnswer:
          if (command.type == CommandType.setDcepFail) {
            _state.value = SessionState.fail;
          } else {
            for (final TxSend tx in _txList!) {
              _sendCommand(
                Command.build(
                  CommandType.setRawTx,
                  param: tx.signedRawTx,
                ),
                SessionState.waitReceipt,
              );
            }
          }

          break;

        case SessionState.waitReceipt:
          if (command.type == CommandType.setRawTxOk) {
            _state.value = SessionState.success;
          } else {
            _state.value = SessionState.fail;
          }
          break;

        default:
          break;
      }
    });

    _sendCommand(
      Command.build(CommandType.getPubKey),
      SessionState.waitPublicKeyAnswer,
    );

    return;
  }
}

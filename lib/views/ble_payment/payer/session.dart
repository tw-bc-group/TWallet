import 'package:crypton/crypton.dart';
import 'package:flutter_ble_lib/flutter_ble_lib.dart';
import 'package:optional/optional.dart';
import 'package:random_string/random_string.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/command.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/extension.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/symm_encrypt.dart';

enum SessionState {
  initial,
  waitPublicKeyAnswer,
  waitAesKeyAnswer,
  waitTxInfo,
}

class Session {
  final Characteristic _readCharacteristic;
  final Characteristic _writeCharacteristic;
  SessionState _state = SessionState.initial;

  Session(this._readCharacteristic, this._writeCharacteristic);

  Future<Command> _checkCommand(Command command) {
    bool matched = true;
    switch (_state) {
      case SessionState.waitPublicKeyAnswer:
        if (command.type != CommandType.setPubKey) {
          matched = false;
        }
        break;

      case SessionState.waitAesKeyAnswer:
        if (command.type != CommandType.ok) {
          matched = false;
        }
        break;

      case SessionState.waitTxInfo:
        if (command.type != CommandType.setTxInfo) {
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

  Future<Optional<SymmEncrypt>> negotiateAesKey() async {
    // _readCharacteristic.monitor().listen((data) {
    //   print('monitor, data: ${String.fromCharCodes(data)}');
    //
    //   final Command command =
    //       Command.fromJson(json.decode(String.fromCharCodes(data)));
    //
    //   print('monitor, command: $command');
    //
    //   switch (command.type) {
    //     case CommandType.answerPublicKey:
    //       if (_state == SessionState.waitPublicKeyAnswer) {}
    //       break;
    //
    //     default:
    //       break;
    //   }
    // });

    try {
      _writeCharacteristic
          .sendCommand(Command.build(CommandType.getPubKey))
          .then((_) => _state = SessionState.waitPublicKeyAnswer);

      final String publicKeyString =
          await Future.delayed(const Duration(seconds: 1))
              .then((_) => _readCharacteristic.receiveCommand())
              .then(_checkCommand)
              .then((command) => command.param);

      if (publicKeyString.isEmpty) {
        throw Exception('public key is empty');
      }

      final String aesKey = randomString(16);
      final String encryptedAesKey =
          RSAPublicKey.fromString(publicKeyString).encrypt(aesKey);

      _writeCharacteristic
          .sendCommand(
              Command.build(CommandType.setAesKey, param: encryptedAesKey))
          .then((_) => _state = SessionState.waitAesKeyAnswer);

      final SymmEncrypt encrypter = SymmEncrypt(aesKey, publicKeyString);

      _readCharacteristic
          .receiveEncryptedCommand(encrypter)
          .then(_checkCommand);

      return Optional.of(encrypter);
      //return const Optional.empty();
    } catch (e) {
      print('session error: $e');
      return const Optional.empty();
    }
  }

  Future<void> transaction(SymmEncrypt encrypter) async {
    try {
      _writeCharacteristic
          .sendEncryptedCommand(encrypter, Command.build(CommandType.getTxInfo))
          .then((_) => _state = SessionState.waitTxInfo);
    } catch (e) {
      print('transaction error: $e');
    }
    return;
  }
}

import 'dart:convert';
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'command.g.dart';

class CommandType extends EnumClass {
  static Serializer<CommandType> get serializer => _$commandTypeSerializer;

  static const CommandType getPubKey = _$getPubKey;
  static const CommandType setPubKey = _$setPubKey;
  static const CommandType setAesKey = _$setAesKey;
  static const CommandType setAesOk = _$setAesOk;
  static const CommandType getTxInfo = _$getTxInfo;
  static const CommandType setTxInfo = _$setTxInfo;
  static const CommandType setDcep = _$setDcep;
  static const CommandType setDcepFail = _$setDcepFail;
  static const CommandType setDcepOk = _$setDcepOk;
  static const CommandType setRawTx = _$setRawTx;
  static const CommandType setRawTxOk = _$setRawTxOk;
  static const CommandType setRawTxFail = _$setRawTxFail;

  static BuiltSet<CommandType> get values => _$values;

  static CommandType valueOf(String name) => _$valueOf(name);

  const CommandType._(String name) : super(name);
}

abstract class Command implements Built<Command, CommandBuilder> {
  static Serializer<Command> get serializer => _$commandSerializer;

  CommandType get type;

  String? get param;

  Uint8List encode() {
    return Uint8List.fromList(
        json.encode(serializers.serialize(this)).codeUnits);
  }

  Map<String, dynamic> toJson() {
    return serializers.serialize(this) as Map<String, dynamic>;
  }

  static Command fromJson(dynamic serialized) {
    try {
      return serializers.deserialize(serialized,
          specifiedType: const FullType(Command)) as Command;
    } catch (error) {
      throw Exception('command deserialize error, $error');
    }
  }

  factory Command([Function(CommandBuilder) updates]) = _$Command;

  factory Command.build(CommandType type, {String? param}) {
    return Command(
      (builder) => builder
        ..type = type
        ..param = param,
    );
  }

  Command._();
}

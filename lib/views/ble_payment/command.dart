import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'command.g.dart';

class CommandType extends EnumClass {
  static Serializer<CommandType> get serializer => _$commandTypeSerializer;

  static const CommandType askInfo = _$askInfo;
  static const CommandType answerInfo = _$answerInfo;
  static const CommandType askPayment = _$askPayment;
  static const CommandType answerPayment = _$answerPayment;

  static BuiltSet<CommandType> get values => _$values;

  static CommandType valueOf(String name) => _$valueOf(name);

  const CommandType._(String name) : super(name);
}

abstract class Command implements Built<Command, CommandBuilder> {
  static Serializer<Command> get serializer => _$commandSerializer;

  CommandType get type;

  @nullable
  String get param;

  Uint8List encode() {
    return Uint8List.fromList(
        (serializers.serialize(this) as String).codeUnits);
  }

  factory Command([Function(CommandBuilder) updates]) = _$Command;

  factory Command.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(Command)) as Command;
  }

  factory Command.build(CommandType type, String param) {
    return Command((builder) => builder
      ..type = type
      ..param = param);
  }

  Command._();
}

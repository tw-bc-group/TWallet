// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CommandType _$askInfo = const CommandType._('askInfo');
const CommandType _$answerInfo = const CommandType._('answerInfo');
const CommandType _$askPayment = const CommandType._('askPayment');
const CommandType _$answerPayment = const CommandType._('answerPayment');

CommandType _$valueOf(String name) {
  switch (name) {
    case 'askInfo':
      return _$askInfo;
    case 'answerInfo':
      return _$answerInfo;
    case 'askPayment':
      return _$askPayment;
    case 'answerPayment':
      return _$answerPayment;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CommandType> _$values =
    new BuiltSet<CommandType>(const <CommandType>[
  _$askInfo,
  _$answerInfo,
  _$askPayment,
  _$answerPayment,
]);

Serializer<CommandType> _$commandTypeSerializer = new _$CommandTypeSerializer();
Serializer<Command> _$commandSerializer = new _$CommandSerializer();

class _$CommandTypeSerializer implements PrimitiveSerializer<CommandType> {
  @override
  final Iterable<Type> types = const <Type>[CommandType];
  @override
  final String wireName = 'CommandType';

  @override
  Object serialize(Serializers serializers, CommandType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  CommandType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CommandType.valueOf(serialized as String);
}

class _$CommandSerializer implements StructuredSerializer<Command> {
  @override
  final Iterable<Type> types = const [Command, _$Command];
  @override
  final String wireName = 'Command';

  @override
  Iterable<Object> serialize(Serializers serializers, Command object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(CommandType)),
    ];
    if (object.param != null) {
      result
        ..add('param')
        ..add(serializers.serialize(object.param,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Command deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CommandBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(CommandType)) as CommandType;
          break;
        case 'param':
          result.param = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Command extends Command {
  @override
  final CommandType type;
  @override
  final String param;

  factory _$Command([void Function(CommandBuilder) updates]) =>
      (new CommandBuilder()..update(updates)).build();

  _$Command._({this.type, this.param}) : super._() {
    if (type == null) {
      throw new BuiltValueNullFieldError('Command', 'type');
    }
  }

  @override
  Command rebuild(void Function(CommandBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CommandBuilder toBuilder() => new CommandBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Command && type == other.type && param == other.param;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), param.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Command')
          ..add('type', type)
          ..add('param', param))
        .toString();
  }
}

class CommandBuilder implements Builder<Command, CommandBuilder> {
  _$Command _$v;

  CommandType _type;
  CommandType get type => _$this._type;
  set type(CommandType type) => _$this._type = type;

  String _param;
  String get param => _$this._param;
  set param(String param) => _$this._param = param;

  CommandBuilder();

  CommandBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _param = _$v.param;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Command other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Command;
  }

  @override
  void update(void Function(CommandBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Command build() {
    final _$result = _$v ?? new _$Command._(type: type, param: param);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

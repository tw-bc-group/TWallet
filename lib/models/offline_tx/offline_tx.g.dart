// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_tx.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OfflineTx> _$offlineTxSerializer = new _$OfflineTxSerializer();

class _$OfflineTxSerializer implements StructuredSerializer<OfflineTx> {
  @override
  final Iterable<Type> types = const [OfflineTx, _$OfflineTx];
  @override
  final String wireName = 'OfflineTx';

  @override
  Iterable<Object> serialize(Serializers serializers, OfflineTx object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'from',
      serializers.serialize(object.from, specifiedType: const FullType(String)),
      'publicKey',
      serializers.serialize(object.publicKey,
          specifiedType: const FullType(String)),
      'tx',
      serializers.serialize(object.tx, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  OfflineTx deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OfflineTxBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'from':
          result.from = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'publicKey':
          result.publicKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tx':
          result.tx = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$OfflineTx extends OfflineTx {
  @override
  final String from;
  @override
  final String publicKey;
  @override
  final String tx;

  factory _$OfflineTx([void Function(OfflineTxBuilder) updates]) =>
      (new OfflineTxBuilder()..update(updates)).build();

  _$OfflineTx._({this.from, this.publicKey, this.tx}) : super._() {
    if (from == null) {
      throw new BuiltValueNullFieldError('OfflineTx', 'from');
    }
    if (publicKey == null) {
      throw new BuiltValueNullFieldError('OfflineTx', 'publicKey');
    }
    if (tx == null) {
      throw new BuiltValueNullFieldError('OfflineTx', 'tx');
    }
  }

  @override
  OfflineTx rebuild(void Function(OfflineTxBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OfflineTxBuilder toBuilder() => new OfflineTxBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OfflineTx &&
        from == other.from &&
        publicKey == other.publicKey &&
        tx == other.tx;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, from.hashCode), publicKey.hashCode), tx.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('OfflineTx')
          ..add('from', from)
          ..add('publicKey', publicKey)
          ..add('tx', tx))
        .toString();
  }
}

class OfflineTxBuilder implements Builder<OfflineTx, OfflineTxBuilder> {
  _$OfflineTx _$v;

  String _from;
  String get from => _$this._from;
  set from(String from) => _$this._from = from;

  String _publicKey;
  String get publicKey => _$this._publicKey;
  set publicKey(String publicKey) => _$this._publicKey = publicKey;

  String _tx;
  String get tx => _$this._tx;
  set tx(String tx) => _$this._tx = tx;

  OfflineTxBuilder();

  OfflineTxBuilder get _$this {
    if (_$v != null) {
      _from = _$v.from;
      _publicKey = _$v.publicKey;
      _tx = _$v.tx;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OfflineTx other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$OfflineTx;
  }

  @override
  void update(void Function(OfflineTxBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$OfflineTx build() {
    final _$result =
        _$v ?? new _$OfflineTx._(from: from, publicKey: publicKey, tx: tx);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

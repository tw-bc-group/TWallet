// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_transaction_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SendTransactionResponse> _$sendTransactionResponseSerializer =
    new _$SendTransactionResponseSerializer();

class _$SendTransactionResponseSerializer
    implements StructuredSerializer<SendTransactionResponse> {
  @override
  final Iterable<Type> types = const [
    SendTransactionResponse,
    _$SendTransactionResponse
  ];
  @override
  final String wireName = 'SendTransactionResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SendTransactionResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'hash',
      serializers.serialize(object.hash, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SendTransactionResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SendTransactionResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hash':
          result.hash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SendTransactionResponse extends SendTransactionResponse {
  @override
  final String hash;

  factory _$SendTransactionResponse(
          [void Function(SendTransactionResponseBuilder)? updates]) =>
      (new SendTransactionResponseBuilder()..update(updates)).build();

  _$SendTransactionResponse._({required this.hash}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        hash, 'SendTransactionResponse', 'hash');
  }

  @override
  SendTransactionResponse rebuild(
          void Function(SendTransactionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendTransactionResponseBuilder toBuilder() =>
      new SendTransactionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendTransactionResponse && hash == other.hash;
  }

  @override
  int get hashCode {
    return $jf($jc(0, hash.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SendTransactionResponse')
          ..add('hash', hash))
        .toString();
  }
}

class SendTransactionResponseBuilder
    implements
        Builder<SendTransactionResponse, SendTransactionResponseBuilder> {
  _$SendTransactionResponse? _$v;

  String? _hash;
  String? get hash => _$this._hash;
  set hash(String? hash) => _$this._hash = hash;

  SendTransactionResponseBuilder();

  SendTransactionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hash = $v.hash;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendTransactionResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SendTransactionResponse;
  }

  @override
  void update(void Function(SendTransactionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SendTransactionResponse build() {
    final _$result = _$v ??
        new _$SendTransactionResponse._(
            hash: BuiltValueNullFieldError.checkNotNull(
                hash, 'SendTransactionResponse', 'hash'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

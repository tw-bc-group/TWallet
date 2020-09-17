// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_transaction_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SendTransactionRequest> _$sendTransactionRequestSerializer =
    new _$SendTransactionRequestSerializer();

class _$SendTransactionRequestSerializer
    implements StructuredSerializer<SendTransactionRequest> {
  @override
  final Iterable<Type> types = const [
    SendTransactionRequest,
    _$SendTransactionRequest
  ];
  @override
  final String wireName = 'SendTransactionRequest';

  @override
  Iterable<Object> serialize(
      Serializers serializers, SendTransactionRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'fromAddress',
      serializers.serialize(object.fromAddress,
          specifiedType: const FullType(String)),
      'fromPublicKey',
      serializers.serialize(object.fromPublicKey,
          specifiedType: const FullType(String)),
      'signedTransactionRawData',
      serializers.serialize(object.signedTransactionRawData,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SendTransactionRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SendTransactionRequestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'fromAddress':
          result.fromAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fromPublicKey':
          result.fromPublicKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'signedTransactionRawData':
          result.signedTransactionRawData = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SendTransactionRequest extends SendTransactionRequest {
  @override
  final String fromAddress;
  @override
  final String fromPublicKey;
  @override
  final String signedTransactionRawData;

  factory _$SendTransactionRequest(
          [void Function(SendTransactionRequestBuilder) updates]) =>
      (new SendTransactionRequestBuilder()..update(updates)).build();

  _$SendTransactionRequest._(
      {this.fromAddress, this.fromPublicKey, this.signedTransactionRawData})
      : super._() {
    if (fromAddress == null) {
      throw new BuiltValueNullFieldError(
          'SendTransactionRequest', 'fromAddress');
    }
    if (fromPublicKey == null) {
      throw new BuiltValueNullFieldError(
          'SendTransactionRequest', 'fromPublicKey');
    }
    if (signedTransactionRawData == null) {
      throw new BuiltValueNullFieldError(
          'SendTransactionRequest', 'signedTransactionRawData');
    }
  }

  @override
  SendTransactionRequest rebuild(
          void Function(SendTransactionRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SendTransactionRequestBuilder toBuilder() =>
      new SendTransactionRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SendTransactionRequest &&
        fromAddress == other.fromAddress &&
        fromPublicKey == other.fromPublicKey &&
        signedTransactionRawData == other.signedTransactionRawData;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, fromAddress.hashCode), fromPublicKey.hashCode),
        signedTransactionRawData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SendTransactionRequest')
          ..add('fromAddress', fromAddress)
          ..add('fromPublicKey', fromPublicKey)
          ..add('signedTransactionRawData', signedTransactionRawData))
        .toString();
  }
}

class SendTransactionRequestBuilder
    implements Builder<SendTransactionRequest, SendTransactionRequestBuilder> {
  _$SendTransactionRequest _$v;

  String _fromAddress;
  String get fromAddress => _$this._fromAddress;
  set fromAddress(String fromAddress) => _$this._fromAddress = fromAddress;

  String _fromPublicKey;
  String get fromPublicKey => _$this._fromPublicKey;
  set fromPublicKey(String fromPublicKey) =>
      _$this._fromPublicKey = fromPublicKey;

  String _signedTransactionRawData;
  String get signedTransactionRawData => _$this._signedTransactionRawData;
  set signedTransactionRawData(String signedTransactionRawData) =>
      _$this._signedTransactionRawData = signedTransactionRawData;

  SendTransactionRequestBuilder();

  SendTransactionRequestBuilder get _$this {
    if (_$v != null) {
      _fromAddress = _$v.fromAddress;
      _fromPublicKey = _$v.fromPublicKey;
      _signedTransactionRawData = _$v.signedTransactionRawData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SendTransactionRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SendTransactionRequest;
  }

  @override
  void update(void Function(SendTransactionRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SendTransactionRequest build() {
    final _$result = _$v ??
        new _$SendTransactionRequest._(
            fromAddress: fromAddress,
            fromPublicKey: fromPublicKey,
            signedTransactionRawData: signedTransactionRawData);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

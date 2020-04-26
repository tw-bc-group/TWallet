// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Transaction> _$transactionSerializer = new _$TransactionSerializer();

class _$TransactionSerializer implements StructuredSerializer<Transaction> {
  @override
  final Iterable<Type> types = const [Transaction, _$Transaction];
  @override
  final String wireName = 'Transaction';

  @override
  Iterable<Object> serialize(Serializers serializers, Transaction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'hash',
      serializers.serialize(object.hash, specifiedType: const FullType(String)),
      'amount',
      serializers.serialize(object.amount,
          specifiedType: const FullType(Amount)),
      'create_time',
      serializers.serialize(object.createTime,
          specifiedType: const FullType(DateTime)),
      'from_address',
      serializers.serialize(object.fromAddress,
          specifiedType: const FullType(String)),
      'to_address',
      serializers.serialize(object.toAddress,
          specifiedType: const FullType(String)),
      'tx_type',
      serializers.serialize(object.txType,
          specifiedType: const FullType(TxStatus)),
    ];
    if (object.confirmTime != null) {
      result
        ..add('confirm_time')
        ..add(serializers.serialize(object.confirmTime,
            specifiedType: const FullType(DateTime)));
    }
    if (object.fromAddressName != null) {
      result
        ..add('from_address_name')
        ..add(serializers.serialize(object.fromAddressName,
            specifiedType: const FullType(String)));
    }
    if (object.toAddressName != null) {
      result
        ..add('to_address_name')
        ..add(serializers.serialize(object.toAddressName,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Transaction deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'hash':
          result.hash = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(Amount)) as Amount;
          break;
        case 'create_time':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'confirm_time':
          result.confirmTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'from_address':
          result.fromAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'from_address_name':
          result.fromAddressName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'to_address':
          result.toAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'to_address_name':
          result.toAddressName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'tx_type':
          result.txType = serializers.deserialize(value,
              specifiedType: const FullType(TxStatus)) as TxStatus;
          break;
      }
    }

    return result.build();
  }
}

class _$Transaction extends Transaction {
  @override
  final String hash;
  @override
  final Amount amount;
  @override
  final DateTime createTime;
  @override
  final DateTime confirmTime;
  @override
  final String fromAddress;
  @override
  final String fromAddressName;
  @override
  final String toAddress;
  @override
  final String toAddressName;
  @override
  final TxStatus txType;

  factory _$Transaction([void Function(TransactionBuilder) updates]) =>
      (new TransactionBuilder()..update(updates)).build();

  _$Transaction._(
      {this.hash,
      this.amount,
      this.createTime,
      this.confirmTime,
      this.fromAddress,
      this.fromAddressName,
      this.toAddress,
      this.toAddressName,
      this.txType})
      : super._() {
    if (hash == null) {
      throw new BuiltValueNullFieldError('Transaction', 'hash');
    }
    if (amount == null) {
      throw new BuiltValueNullFieldError('Transaction', 'amount');
    }
    if (createTime == null) {
      throw new BuiltValueNullFieldError('Transaction', 'createTime');
    }
    if (fromAddress == null) {
      throw new BuiltValueNullFieldError('Transaction', 'fromAddress');
    }
    if (toAddress == null) {
      throw new BuiltValueNullFieldError('Transaction', 'toAddress');
    }
    if (txType == null) {
      throw new BuiltValueNullFieldError('Transaction', 'txType');
    }
  }

  @override
  Transaction rebuild(void Function(TransactionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionBuilder toBuilder() => new TransactionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Transaction &&
        hash == other.hash &&
        amount == other.amount &&
        createTime == other.createTime &&
        confirmTime == other.confirmTime &&
        fromAddress == other.fromAddress &&
        fromAddressName == other.fromAddressName &&
        toAddress == other.toAddress &&
        toAddressName == other.toAddressName &&
        txType == other.txType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, hash.hashCode), amount.hashCode),
                                createTime.hashCode),
                            confirmTime.hashCode),
                        fromAddress.hashCode),
                    fromAddressName.hashCode),
                toAddress.hashCode),
            toAddressName.hashCode),
        txType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Transaction')
          ..add('hash', hash)
          ..add('amount', amount)
          ..add('createTime', createTime)
          ..add('confirmTime', confirmTime)
          ..add('fromAddress', fromAddress)
          ..add('fromAddressName', fromAddressName)
          ..add('toAddress', toAddress)
          ..add('toAddressName', toAddressName)
          ..add('txType', txType))
        .toString();
  }
}

class TransactionBuilder implements Builder<Transaction, TransactionBuilder> {
  _$Transaction _$v;

  String _hash;
  String get hash => _$this._hash;
  set hash(String hash) => _$this._hash = hash;

  Amount _amount;
  Amount get amount => _$this._amount;
  set amount(Amount amount) => _$this._amount = amount;

  DateTime _createTime;
  DateTime get createTime => _$this._createTime;
  set createTime(DateTime createTime) => _$this._createTime = createTime;

  DateTime _confirmTime;
  DateTime get confirmTime => _$this._confirmTime;
  set confirmTime(DateTime confirmTime) => _$this._confirmTime = confirmTime;

  String _fromAddress;
  String get fromAddress => _$this._fromAddress;
  set fromAddress(String fromAddress) => _$this._fromAddress = fromAddress;

  String _fromAddressName;
  String get fromAddressName => _$this._fromAddressName;
  set fromAddressName(String fromAddressName) =>
      _$this._fromAddressName = fromAddressName;

  String _toAddress;
  String get toAddress => _$this._toAddress;
  set toAddress(String toAddress) => _$this._toAddress = toAddress;

  String _toAddressName;
  String get toAddressName => _$this._toAddressName;
  set toAddressName(String toAddressName) =>
      _$this._toAddressName = toAddressName;

  TxStatus _txType;
  TxStatus get txType => _$this._txType;
  set txType(TxStatus txType) => _$this._txType = txType;

  TransactionBuilder();

  TransactionBuilder get _$this {
    if (_$v != null) {
      _hash = _$v.hash;
      _amount = _$v.amount;
      _createTime = _$v.createTime;
      _confirmTime = _$v.confirmTime;
      _fromAddress = _$v.fromAddress;
      _fromAddressName = _$v.fromAddressName;
      _toAddress = _$v.toAddress;
      _toAddressName = _$v.toAddressName;
      _txType = _$v.txType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transaction other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Transaction;
  }

  @override
  void update(void Function(TransactionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Transaction build() {
    final _$result = _$v ??
        new _$Transaction._(
            hash: hash,
            amount: amount,
            createTime: createTime,
            confirmTime: confirmTime,
            fromAddress: fromAddress,
            fromAddressName: fromAddressName,
            toAddress: toAddress,
            toAddressName: toAddressName,
            txType: txType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

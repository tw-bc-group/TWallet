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
  Iterable<Object?> serialize(Serializers serializers, Transaction object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
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
    Object? value;
    value = object.confirmTime;
    if (value != null) {
      result
        ..add('confirm_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.fromAddressName;
    if (value != null) {
      result
        ..add('from_address_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.toAddressName;
    if (value != null) {
      result
        ..add('to_address_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Transaction deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hash':
          result.hash = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(Amount))! as Amount;
          break;
        case 'create_time':
          result.createTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
        case 'confirm_time':
          result.confirmTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'from_address':
          result.fromAddress = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'from_address_name':
          result.fromAddressName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'to_address':
          result.toAddress = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'to_address_name':
          result.toAddressName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tx_type':
          result.txType = serializers.deserialize(value,
              specifiedType: const FullType(TxStatus))! as TxStatus;
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
  final DateTime? confirmTime;
  @override
  final String fromAddress;
  @override
  final String? fromAddressName;
  @override
  final String toAddress;
  @override
  final String? toAddressName;
  @override
  final TxStatus txType;

  factory _$Transaction([void Function(TransactionBuilder)? updates]) =>
      (new TransactionBuilder()..update(updates))._build();

  _$Transaction._(
      {required this.hash,
      required this.amount,
      required this.createTime,
      this.confirmTime,
      required this.fromAddress,
      this.fromAddressName,
      required this.toAddress,
      this.toAddressName,
      required this.txType})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(hash, r'Transaction', 'hash');
    BuiltValueNullFieldError.checkNotNull(amount, r'Transaction', 'amount');
    BuiltValueNullFieldError.checkNotNull(
        createTime, r'Transaction', 'createTime');
    BuiltValueNullFieldError.checkNotNull(
        fromAddress, r'Transaction', 'fromAddress');
    BuiltValueNullFieldError.checkNotNull(
        toAddress, r'Transaction', 'toAddress');
    BuiltValueNullFieldError.checkNotNull(txType, r'Transaction', 'txType');
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
    return (newBuiltValueToStringHelper(r'Transaction')
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
  _$Transaction? _$v;

  String? _hash;
  String? get hash => _$this._hash;
  set hash(String? hash) => _$this._hash = hash;

  Amount? _amount;
  Amount? get amount => _$this._amount;
  set amount(Amount? amount) => _$this._amount = amount;

  DateTime? _createTime;
  DateTime? get createTime => _$this._createTime;
  set createTime(DateTime? createTime) => _$this._createTime = createTime;

  DateTime? _confirmTime;
  DateTime? get confirmTime => _$this._confirmTime;
  set confirmTime(DateTime? confirmTime) => _$this._confirmTime = confirmTime;

  String? _fromAddress;
  String? get fromAddress => _$this._fromAddress;
  set fromAddress(String? fromAddress) => _$this._fromAddress = fromAddress;

  String? _fromAddressName;
  String? get fromAddressName => _$this._fromAddressName;
  set fromAddressName(String? fromAddressName) =>
      _$this._fromAddressName = fromAddressName;

  String? _toAddress;
  String? get toAddress => _$this._toAddress;
  set toAddress(String? toAddress) => _$this._toAddress = toAddress;

  String? _toAddressName;
  String? get toAddressName => _$this._toAddressName;
  set toAddressName(String? toAddressName) =>
      _$this._toAddressName = toAddressName;

  TxStatus? _txType;
  TxStatus? get txType => _$this._txType;
  set txType(TxStatus? txType) => _$this._txType = txType;

  TransactionBuilder();

  TransactionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hash = $v.hash;
      _amount = $v.amount;
      _createTime = $v.createTime;
      _confirmTime = $v.confirmTime;
      _fromAddress = $v.fromAddress;
      _fromAddressName = $v.fromAddressName;
      _toAddress = $v.toAddress;
      _toAddressName = $v.toAddressName;
      _txType = $v.txType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Transaction other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Transaction;
  }

  @override
  void update(void Function(TransactionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Transaction build() => _build();

  _$Transaction _build() {
    final _$result = _$v ??
        new _$Transaction._(
            hash: BuiltValueNullFieldError.checkNotNull(
                hash, r'Transaction', 'hash'),
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'Transaction', 'amount'),
            createTime: BuiltValueNullFieldError.checkNotNull(
                createTime, r'Transaction', 'createTime'),
            confirmTime: confirmTime,
            fromAddress: BuiltValueNullFieldError.checkNotNull(
                fromAddress, r'Transaction', 'fromAddress'),
            fromAddressName: fromAddressName,
            toAddress: BuiltValueNullFieldError.checkNotNull(
                toAddress, r'Transaction', 'toAddress'),
            toAddressName: toAddressName,
            txType: BuiltValueNullFieldError.checkNotNull(
                txType, r'Transaction', 'txType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

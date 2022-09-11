// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verified.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Verified> _$verifiedSerializer = new _$VerifiedSerializer();

class _$VerifiedSerializer implements StructuredSerializer<Verified> {
  @override
  final Iterable<Type> types = const [Verified, _$Verified];
  @override
  final String wireName = 'Verified';

  @override
  Iterable<Object?> serialize(Serializers serializers, Verified object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'overdue',
      serializers.serialize(object.overdue,
          specifiedType: const FullType(String)),
      'revoked',
      serializers.serialize(object.revoked,
          specifiedType: const FullType(String)),
      'onchain',
      serializers.serialize(object.onchain,
          specifiedType: const FullType(String)),
      'verify_signature',
      serializers.serialize(object.verifySignature,
          specifiedType: const FullType(String)),
      'verify_holder',
      serializers.serialize(object.verifyHolder,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Verified deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VerifiedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'overdue':
          result.overdue = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'revoked':
          result.revoked = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'onchain':
          result.onchain = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'verify_signature':
          result.verifySignature = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'verify_holder':
          result.verifyHolder = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Verified extends Verified {
  @override
  final String overdue;
  @override
  final String revoked;
  @override
  final String onchain;
  @override
  final String verifySignature;
  @override
  final String verifyHolder;

  factory _$Verified([void Function(VerifiedBuilder)? updates]) =>
      (new VerifiedBuilder()..update(updates))._build();

  _$Verified._(
      {required this.overdue,
      required this.revoked,
      required this.onchain,
      required this.verifySignature,
      required this.verifyHolder})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(overdue, r'Verified', 'overdue');
    BuiltValueNullFieldError.checkNotNull(revoked, r'Verified', 'revoked');
    BuiltValueNullFieldError.checkNotNull(onchain, r'Verified', 'onchain');
    BuiltValueNullFieldError.checkNotNull(
        verifySignature, r'Verified', 'verifySignature');
    BuiltValueNullFieldError.checkNotNull(
        verifyHolder, r'Verified', 'verifyHolder');
  }

  @override
  Verified rebuild(void Function(VerifiedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifiedBuilder toBuilder() => new VerifiedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Verified &&
        overdue == other.overdue &&
        revoked == other.revoked &&
        onchain == other.onchain &&
        verifySignature == other.verifySignature &&
        verifyHolder == other.verifyHolder;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, overdue.hashCode), revoked.hashCode),
                onchain.hashCode),
            verifySignature.hashCode),
        verifyHolder.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Verified')
          ..add('overdue', overdue)
          ..add('revoked', revoked)
          ..add('onchain', onchain)
          ..add('verifySignature', verifySignature)
          ..add('verifyHolder', verifyHolder))
        .toString();
  }
}

class VerifiedBuilder implements Builder<Verified, VerifiedBuilder> {
  _$Verified? _$v;

  String? _overdue;
  String? get overdue => _$this._overdue;
  set overdue(String? overdue) => _$this._overdue = overdue;

  String? _revoked;
  String? get revoked => _$this._revoked;
  set revoked(String? revoked) => _$this._revoked = revoked;

  String? _onchain;
  String? get onchain => _$this._onchain;
  set onchain(String? onchain) => _$this._onchain = onchain;

  String? _verifySignature;
  String? get verifySignature => _$this._verifySignature;
  set verifySignature(String? verifySignature) =>
      _$this._verifySignature = verifySignature;

  String? _verifyHolder;
  String? get verifyHolder => _$this._verifyHolder;
  set verifyHolder(String? verifyHolder) => _$this._verifyHolder = verifyHolder;

  VerifiedBuilder();

  VerifiedBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _overdue = $v.overdue;
      _revoked = $v.revoked;
      _onchain = $v.onchain;
      _verifySignature = $v.verifySignature;
      _verifyHolder = $v.verifyHolder;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Verified other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Verified;
  }

  @override
  void update(void Function(VerifiedBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Verified build() => _build();

  _$Verified _build() {
    final _$result = _$v ??
        new _$Verified._(
            overdue: BuiltValueNullFieldError.checkNotNull(
                overdue, r'Verified', 'overdue'),
            revoked: BuiltValueNullFieldError.checkNotNull(
                revoked, r'Verified', 'revoked'),
            onchain: BuiltValueNullFieldError.checkNotNull(
                onchain, r'Verified', 'onchain'),
            verifySignature: BuiltValueNullFieldError.checkNotNull(
                verifySignature, r'Verified', 'verifySignature'),
            verifyHolder: BuiltValueNullFieldError.checkNotNull(
                verifyHolder, r'Verified', 'verifyHolder'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

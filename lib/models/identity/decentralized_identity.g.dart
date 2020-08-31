// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decentralized_identity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DecentralizedIdentity> _$decentralizedIdentitySerializer =
    new _$DecentralizedIdentitySerializer();

class _$DecentralizedIdentitySerializer
    implements StructuredSerializer<DecentralizedIdentity> {
  @override
  final Iterable<Type> types = const [
    DecentralizedIdentity,
    _$DecentralizedIdentity
  ];
  @override
  final String wireName = 'DecentralizedIdentity';

  @override
  Iterable<Object> serialize(
      Serializers serializers, DecentralizedIdentity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'dappId',
      serializers.serialize(object.dappId,
          specifiedType: const FullType(String)),
      'isSelected',
      serializers.serialize(object.isSelected,
          specifiedType: const FullType(bool)),
      'profileInfo',
      serializers.serialize(object.profileInfo,
          specifiedType: const FullType(ProfileInfo)),
      'accountInfo',
      serializers.serialize(object.accountInfo,
          specifiedType: const FullType(AccountInfo)),
      'healthInfo',
      serializers.serialize(object.healthInfo,
          specifiedType: const FullType(HealthInfo)),
    ];
    if (object.extra != null) {
      result
        ..add('extra')
        ..add(serializers.serialize(object.extra,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DecentralizedIdentity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DecentralizedIdentityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dappId':
          result.dappId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isSelected':
          result.isSelected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'profileInfo':
          result.profileInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(ProfileInfo)) as ProfileInfo);
          break;
        case 'accountInfo':
          result.accountInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(AccountInfo)) as AccountInfo);
          break;
        case 'healthInfo':
          result.healthInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(HealthInfo)) as HealthInfo);
          break;
        case 'extra':
          result.extra = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DecentralizedIdentity extends DecentralizedIdentity {
  @override
  final String id;
  @override
  final String dappId;
  @override
  final bool isSelected;
  @override
  final ProfileInfo profileInfo;
  @override
  final AccountInfo accountInfo;
  @override
  final HealthInfo healthInfo;
  @override
  final String extra;
  String __address;
  DID __did;

  factory _$DecentralizedIdentity(
          [void Function(DecentralizedIdentityBuilder) updates]) =>
      (new DecentralizedIdentityBuilder()..update(updates)).build();

  _$DecentralizedIdentity._(
      {this.id,
      this.dappId,
      this.isSelected,
      this.profileInfo,
      this.accountInfo,
      this.healthInfo,
      this.extra})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('DecentralizedIdentity', 'id');
    }
    if (dappId == null) {
      throw new BuiltValueNullFieldError('DecentralizedIdentity', 'dappId');
    }
    if (isSelected == null) {
      throw new BuiltValueNullFieldError('DecentralizedIdentity', 'isSelected');
    }
    if (profileInfo == null) {
      throw new BuiltValueNullFieldError(
          'DecentralizedIdentity', 'profileInfo');
    }
    if (accountInfo == null) {
      throw new BuiltValueNullFieldError(
          'DecentralizedIdentity', 'accountInfo');
    }
    if (healthInfo == null) {
      throw new BuiltValueNullFieldError('DecentralizedIdentity', 'healthInfo');
    }
  }

  @override
  String get address => __address ??= super.address;

  @override
  DID get did => __did ??= super.did;

  @override
  DecentralizedIdentity rebuild(
          void Function(DecentralizedIdentityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DecentralizedIdentityBuilder toBuilder() =>
      new DecentralizedIdentityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DecentralizedIdentity &&
        id == other.id &&
        dappId == other.dappId &&
        isSelected == other.isSelected &&
        profileInfo == other.profileInfo &&
        accountInfo == other.accountInfo &&
        healthInfo == other.healthInfo &&
        extra == other.extra;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), dappId.hashCode),
                        isSelected.hashCode),
                    profileInfo.hashCode),
                accountInfo.hashCode),
            healthInfo.hashCode),
        extra.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DecentralizedIdentity')
          ..add('id', id)
          ..add('dappId', dappId)
          ..add('isSelected', isSelected)
          ..add('profileInfo', profileInfo)
          ..add('accountInfo', accountInfo)
          ..add('healthInfo', healthInfo)
          ..add('extra', extra))
        .toString();
  }
}

class DecentralizedIdentityBuilder
    implements Builder<DecentralizedIdentity, DecentralizedIdentityBuilder> {
  _$DecentralizedIdentity _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _dappId;
  String get dappId => _$this._dappId;
  set dappId(String dappId) => _$this._dappId = dappId;

  bool _isSelected;
  bool get isSelected => _$this._isSelected;
  set isSelected(bool isSelected) => _$this._isSelected = isSelected;

  ProfileInfoBuilder _profileInfo;
  ProfileInfoBuilder get profileInfo =>
      _$this._profileInfo ??= new ProfileInfoBuilder();
  set profileInfo(ProfileInfoBuilder profileInfo) =>
      _$this._profileInfo = profileInfo;

  AccountInfoBuilder _accountInfo;
  AccountInfoBuilder get accountInfo =>
      _$this._accountInfo ??= new AccountInfoBuilder();
  set accountInfo(AccountInfoBuilder accountInfo) =>
      _$this._accountInfo = accountInfo;

  HealthInfoBuilder _healthInfo;
  HealthInfoBuilder get healthInfo =>
      _$this._healthInfo ??= new HealthInfoBuilder();
  set healthInfo(HealthInfoBuilder healthInfo) =>
      _$this._healthInfo = healthInfo;

  String _extra;
  String get extra => _$this._extra;
  set extra(String extra) => _$this._extra = extra;

  DecentralizedIdentityBuilder();

  DecentralizedIdentityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _dappId = _$v.dappId;
      _isSelected = _$v.isSelected;
      _profileInfo = _$v.profileInfo?.toBuilder();
      _accountInfo = _$v.accountInfo?.toBuilder();
      _healthInfo = _$v.healthInfo?.toBuilder();
      _extra = _$v.extra;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DecentralizedIdentity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DecentralizedIdentity;
  }

  @override
  void update(void Function(DecentralizedIdentityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DecentralizedIdentity build() {
    _$DecentralizedIdentity _$result;
    try {
      _$result = _$v ??
          new _$DecentralizedIdentity._(
              id: id,
              dappId: dappId,
              isSelected: isSelected,
              profileInfo: profileInfo.build(),
              accountInfo: accountInfo.build(),
              healthInfo: healthInfo.build(),
              extra: extra);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'profileInfo';
        profileInfo.build();
        _$failedField = 'accountInfo';
        accountInfo.build();
        _$failedField = 'healthInfo';
        healthInfo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DecentralizedIdentity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

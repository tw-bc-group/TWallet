// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Identity> _$identitySerializer = new _$IdentitySerializer();

class _$IdentitySerializer implements StructuredSerializer<Identity> {
  @override
  final Iterable<Type> types = const [Identity, _$Identity];
  @override
  final String wireName = 'Identity';

  @override
  Iterable<Object> serialize(Serializers serializers, Identity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'pubKey',
      serializers.serialize(object.pubKey,
          specifiedType: const FullType(String)),
      'priKey',
      serializers.serialize(object.priKey,
          specifiedType: const FullType(String)),
    ];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(String)));
    }
    if (object.avatar != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(object.avatar,
            specifiedType: const FullType(String)));
    }
    if (object.phone != null) {
      result
        ..add('phone')
        ..add(serializers.serialize(object.phone,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.birthday != null) {
      result
        ..add('birthday')
        ..add(serializers.serialize(object.birthday,
            specifiedType: const FullType(String)));
    }
    if (object.balance != null) {
      result
        ..add('balance')
        ..add(serializers.serialize(object.balance,
            specifiedType: const FullType(Amount)));
    }
    return result;
  }

  @override
  Identity deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new IdentityBuilder();

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
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pubKey':
          result.pubKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'priKey':
          result.priKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'balance':
          result.balance = serializers.deserialize(value,
              specifiedType: const FullType(Amount)) as Amount;
          break;
      }
    }

    return result.build();
  }
}

class _$Identity extends Identity {
  @override
  final String id;
  @override
  final String avatar;
  @override
  final String name;
  @override
  final String pubKey;
  @override
  final String priKey;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String birthday;
  @override
  final Amount balance;
  String __address;
  String __did;
  Optional<Avataaar> __avataaar;

  factory _$Identity([void Function(IdentityBuilder) updates]) =>
      (new IdentityBuilder()..update(updates)).build();

  _$Identity._(
      {this.id,
      this.avatar,
      this.name,
      this.pubKey,
      this.priKey,
      this.phone,
      this.email,
      this.birthday,
      this.balance})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('Identity', 'name');
    }
    if (pubKey == null) {
      throw new BuiltValueNullFieldError('Identity', 'pubKey');
    }
    if (priKey == null) {
      throw new BuiltValueNullFieldError('Identity', 'priKey');
    }
  }

  @override
  String get address => __address ??= super.address;

  @override
  String get did => __did ??= super.did;

  @override
  Optional<Avataaar> get avataaar => __avataaar ??= super.avataaar;

  @override
  Identity rebuild(void Function(IdentityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IdentityBuilder toBuilder() => new IdentityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Identity &&
        id == other.id &&
        avatar == other.avatar &&
        name == other.name &&
        pubKey == other.pubKey &&
        priKey == other.priKey &&
        phone == other.phone &&
        email == other.email &&
        birthday == other.birthday &&
        balance == other.balance;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), avatar.hashCode),
                                name.hashCode),
                            pubKey.hashCode),
                        priKey.hashCode),
                    phone.hashCode),
                email.hashCode),
            birthday.hashCode),
        balance.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Identity')
          ..add('id', id)
          ..add('avatar', avatar)
          ..add('name', name)
          ..add('pubKey', pubKey)
          ..add('priKey', priKey)
          ..add('phone', phone)
          ..add('email', email)
          ..add('birthday', birthday)
          ..add('balance', balance))
        .toString();
  }
}

class IdentityBuilder implements Builder<Identity, IdentityBuilder> {
  _$Identity _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _avatar;
  String get avatar => _$this._avatar;
  set avatar(String avatar) => _$this._avatar = avatar;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _pubKey;
  String get pubKey => _$this._pubKey;
  set pubKey(String pubKey) => _$this._pubKey = pubKey;

  String _priKey;
  String get priKey => _$this._priKey;
  set priKey(String priKey) => _$this._priKey = priKey;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _birthday;
  String get birthday => _$this._birthday;
  set birthday(String birthday) => _$this._birthday = birthday;

  Amount _balance;
  Amount get balance => _$this._balance;
  set balance(Amount balance) => _$this._balance = balance;

  IdentityBuilder();

  IdentityBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _avatar = _$v.avatar;
      _name = _$v.name;
      _pubKey = _$v.pubKey;
      _priKey = _$v.priKey;
      _phone = _$v.phone;
      _email = _$v.email;
      _birthday = _$v.birthday;
      _balance = _$v.balance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Identity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Identity;
  }

  @override
  void update(void Function(IdentityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Identity build() {
    final _$result = _$v ??
        new _$Identity._(
            id: id,
            avatar: avatar,
            name: name,
            pubKey: pubKey,
            priKey: priKey,
            phone: phone,
            email: email,
            birthday: birthday,
            balance: balance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

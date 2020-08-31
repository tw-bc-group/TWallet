// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileInfo> _$profileInfoSerializer = new _$ProfileInfoSerializer();

class _$ProfileInfoSerializer implements StructuredSerializer<ProfileInfo> {
  @override
  final Iterable<Type> types = const [ProfileInfo, _$ProfileInfo];
  @override
  final String wireName = 'ProfileInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, ProfileInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
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
    return result;
  }

  @override
  ProfileInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
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
      }
    }

    return result.build();
  }
}

class _$ProfileInfo extends ProfileInfo {
  @override
  final String name;
  @override
  final String phone;
  @override
  final String email;
  @override
  final String birthday;

  factory _$ProfileInfo([void Function(ProfileInfoBuilder) updates]) =>
      (new ProfileInfoBuilder()..update(updates)).build();

  _$ProfileInfo._({this.name, this.phone, this.email, this.birthday})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('ProfileInfo', 'name');
    }
  }

  @override
  ProfileInfo rebuild(void Function(ProfileInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileInfoBuilder toBuilder() => new ProfileInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileInfo &&
        name == other.name &&
        phone == other.phone &&
        email == other.email &&
        birthday == other.birthday;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), phone.hashCode), email.hashCode),
        birthday.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileInfo')
          ..add('name', name)
          ..add('phone', phone)
          ..add('email', email)
          ..add('birthday', birthday))
        .toString();
  }
}

class ProfileInfoBuilder implements Builder<ProfileInfo, ProfileInfoBuilder> {
  _$ProfileInfo _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _phone;
  String get phone => _$this._phone;
  set phone(String phone) => _$this._phone = phone;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _birthday;
  String get birthday => _$this._birthday;
  set birthday(String birthday) => _$this._birthday = birthday;

  ProfileInfoBuilder();

  ProfileInfoBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _phone = _$v.phone;
      _email = _$v.email;
      _birthday = _$v.birthday;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileInfo;
  }

  @override
  void update(void Function(ProfileInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileInfo build() {
    final _$result = _$v ??
        new _$ProfileInfo._(
            name: name, phone: phone, email: email, birthday: birthday);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

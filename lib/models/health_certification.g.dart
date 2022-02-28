// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_certification.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HealthCertification> _$healthCertificationSerializer =
    new _$HealthCertificationSerializer();
Serializer<HealthCertificationSub> _$healthCertificationSubSerializer =
    new _$HealthCertificationSubSerializer();
Serializer<HealthyStatus> _$healthyStatusSerializer =
    new _$HealthyStatusSerializer();

class _$HealthCertificationSerializer
    implements StructuredSerializer<HealthCertification> {
  @override
  final Iterable<Type> types = const [
    HealthCertification,
    _$HealthCertification
  ];
  @override
  final String wireName = 'HealthCertification';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HealthCertification object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '@context',
      serializers.serialize(object.context,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'exp',
      serializers.serialize(object.exp, specifiedType: const FullType(int)),
      'iat',
      serializers.serialize(object.iat, specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'iss',
      serializers.serialize(object.iss, specifiedType: const FullType(String)),
      'ver',
      serializers.serialize(object.ver, specifiedType: const FullType(String)),
      'typ',
      serializers.serialize(object.typ,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'sub',
      serializers.serialize(object.sub,
          specifiedType: const FullType(HealthCertificationSub)),
    ];

    return result;
  }

  @override
  HealthCertification deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HealthCertificationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '@context':
          result.context.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'exp':
          result.exp = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'iat':
          result.iat = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'iss':
          result.iss = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ver':
          result.ver = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'typ':
          result.typ.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'sub':
          result.sub.replace(serializers.deserialize(value,
                  specifiedType: const FullType(HealthCertificationSub))!
              as HealthCertificationSub);
          break;
      }
    }

    return result.build();
  }
}

class _$HealthCertificationSubSerializer
    implements StructuredSerializer<HealthCertificationSub> {
  @override
  final Iterable<Type> types = const [
    HealthCertificationSub,
    _$HealthCertificationSub
  ];
  @override
  final String wireName = 'HealthCertificationSub';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, HealthCertificationSub object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
      'healthyStatus',
      serializers.serialize(object.healthyStatus,
          specifiedType: const FullType(HealthyStatus)),
    ];

    return result;
  }

  @override
  HealthCertificationSub deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HealthCertificationSubBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'healthyStatus':
          result.healthyStatus.replace(serializers.deserialize(value,
              specifiedType: const FullType(HealthyStatus))! as HealthyStatus);
          break;
      }
    }

    return result.build();
  }
}

class _$HealthyStatusSerializer implements StructuredSerializer<HealthyStatus> {
  @override
  final Iterable<Type> types = const [HealthyStatus, _$HealthyStatus];
  @override
  final String wireName = 'HealthyStatus';

  @override
  Iterable<Object?> serialize(Serializers serializers, HealthyStatus object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'typ',
      serializers.serialize(object.typ, specifiedType: const FullType(String)),
      'val',
      serializers.serialize(object.val, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  HealthyStatus deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HealthyStatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'typ':
          result.typ = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'val':
          result.val = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HealthCertification extends HealthCertification {
  @override
  final BuiltList<String> context;
  @override
  final int exp;
  @override
  final int iat;
  @override
  final String id;
  @override
  final String iss;
  @override
  final String ver;
  @override
  final BuiltList<String> typ;
  @override
  final HealthCertificationSub sub;

  factory _$HealthCertification(
          [void Function(HealthCertificationBuilder)? updates]) =>
      (new HealthCertificationBuilder()..update(updates)).build();

  _$HealthCertification._(
      {required this.context,
      required this.exp,
      required this.iat,
      required this.id,
      required this.iss,
      required this.ver,
      required this.typ,
      required this.sub})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        context, 'HealthCertification', 'context');
    BuiltValueNullFieldError.checkNotNull(exp, 'HealthCertification', 'exp');
    BuiltValueNullFieldError.checkNotNull(iat, 'HealthCertification', 'iat');
    BuiltValueNullFieldError.checkNotNull(id, 'HealthCertification', 'id');
    BuiltValueNullFieldError.checkNotNull(iss, 'HealthCertification', 'iss');
    BuiltValueNullFieldError.checkNotNull(ver, 'HealthCertification', 'ver');
    BuiltValueNullFieldError.checkNotNull(typ, 'HealthCertification', 'typ');
    BuiltValueNullFieldError.checkNotNull(sub, 'HealthCertification', 'sub');
  }

  @override
  HealthCertification rebuild(
          void Function(HealthCertificationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthCertificationBuilder toBuilder() =>
      new HealthCertificationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthCertification &&
        context == other.context &&
        exp == other.exp &&
        iat == other.iat &&
        id == other.id &&
        iss == other.iss &&
        ver == other.ver &&
        typ == other.typ &&
        sub == other.sub;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, context.hashCode), exp.hashCode),
                            iat.hashCode),
                        id.hashCode),
                    iss.hashCode),
                ver.hashCode),
            typ.hashCode),
        sub.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HealthCertification')
          ..add('context', context)
          ..add('exp', exp)
          ..add('iat', iat)
          ..add('id', id)
          ..add('iss', iss)
          ..add('ver', ver)
          ..add('typ', typ)
          ..add('sub', sub))
        .toString();
  }
}

class HealthCertificationBuilder
    implements Builder<HealthCertification, HealthCertificationBuilder> {
  _$HealthCertification? _$v;

  ListBuilder<String>? _context;
  ListBuilder<String> get context =>
      _$this._context ??= new ListBuilder<String>();
  set context(ListBuilder<String>? context) => _$this._context = context;

  int? _exp;
  int? get exp => _$this._exp;
  set exp(int? exp) => _$this._exp = exp;

  int? _iat;
  int? get iat => _$this._iat;
  set iat(int? iat) => _$this._iat = iat;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _iss;
  String? get iss => _$this._iss;
  set iss(String? iss) => _$this._iss = iss;

  String? _ver;
  String? get ver => _$this._ver;
  set ver(String? ver) => _$this._ver = ver;

  ListBuilder<String>? _typ;
  ListBuilder<String> get typ => _$this._typ ??= new ListBuilder<String>();
  set typ(ListBuilder<String>? typ) => _$this._typ = typ;

  HealthCertificationSubBuilder? _sub;
  HealthCertificationSubBuilder get sub =>
      _$this._sub ??= new HealthCertificationSubBuilder();
  set sub(HealthCertificationSubBuilder? sub) => _$this._sub = sub;

  HealthCertificationBuilder();

  HealthCertificationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _context = $v.context.toBuilder();
      _exp = $v.exp;
      _iat = $v.iat;
      _id = $v.id;
      _iss = $v.iss;
      _ver = $v.ver;
      _typ = $v.typ.toBuilder();
      _sub = $v.sub.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthCertification other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HealthCertification;
  }

  @override
  void update(void Function(HealthCertificationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HealthCertification build() {
    _$HealthCertification _$result;
    try {
      _$result = _$v ??
          new _$HealthCertification._(
              context: context.build(),
              exp: BuiltValueNullFieldError.checkNotNull(
                  exp, 'HealthCertification', 'exp'),
              iat: BuiltValueNullFieldError.checkNotNull(
                  iat, 'HealthCertification', 'iat'),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'HealthCertification', 'id'),
              iss: BuiltValueNullFieldError.checkNotNull(
                  iss, 'HealthCertification', 'iss'),
              ver: BuiltValueNullFieldError.checkNotNull(
                  ver, 'HealthCertification', 'ver'),
              typ: typ.build(),
              sub: sub.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'context';
        context.build();

        _$failedField = 'typ';
        typ.build();
        _$failedField = 'sub';
        sub.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HealthCertification', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$HealthCertificationSub extends HealthCertificationSub {
  @override
  final String id;
  @override
  final String phone;
  @override
  final HealthyStatus healthyStatus;

  factory _$HealthCertificationSub(
          [void Function(HealthCertificationSubBuilder)? updates]) =>
      (new HealthCertificationSubBuilder()..update(updates)).build();

  _$HealthCertificationSub._(
      {required this.id, required this.phone, required this.healthyStatus})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, 'HealthCertificationSub', 'id');
    BuiltValueNullFieldError.checkNotNull(
        phone, 'HealthCertificationSub', 'phone');
    BuiltValueNullFieldError.checkNotNull(
        healthyStatus, 'HealthCertificationSub', 'healthyStatus');
  }

  @override
  HealthCertificationSub rebuild(
          void Function(HealthCertificationSubBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthCertificationSubBuilder toBuilder() =>
      new HealthCertificationSubBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthCertificationSub &&
        id == other.id &&
        phone == other.phone &&
        healthyStatus == other.healthyStatus;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, id.hashCode), phone.hashCode), healthyStatus.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HealthCertificationSub')
          ..add('id', id)
          ..add('phone', phone)
          ..add('healthyStatus', healthyStatus))
        .toString();
  }
}

class HealthCertificationSubBuilder
    implements Builder<HealthCertificationSub, HealthCertificationSubBuilder> {
  _$HealthCertificationSub? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  HealthyStatusBuilder? _healthyStatus;
  HealthyStatusBuilder get healthyStatus =>
      _$this._healthyStatus ??= new HealthyStatusBuilder();
  set healthyStatus(HealthyStatusBuilder? healthyStatus) =>
      _$this._healthyStatus = healthyStatus;

  HealthCertificationSubBuilder();

  HealthCertificationSubBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _phone = $v.phone;
      _healthyStatus = $v.healthyStatus.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthCertificationSub other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HealthCertificationSub;
  }

  @override
  void update(void Function(HealthCertificationSubBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HealthCertificationSub build() {
    _$HealthCertificationSub _$result;
    try {
      _$result = _$v ??
          new _$HealthCertificationSub._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, 'HealthCertificationSub', 'id'),
              phone: BuiltValueNullFieldError.checkNotNull(
                  phone, 'HealthCertificationSub', 'phone'),
              healthyStatus: healthyStatus.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'healthyStatus';
        healthyStatus.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HealthCertificationSub', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$HealthyStatus extends HealthyStatus {
  @override
  final String typ;
  @override
  final String val;

  factory _$HealthyStatus([void Function(HealthyStatusBuilder)? updates]) =>
      (new HealthyStatusBuilder()..update(updates)).build();

  _$HealthyStatus._({required this.typ, required this.val}) : super._() {
    BuiltValueNullFieldError.checkNotNull(typ, 'HealthyStatus', 'typ');
    BuiltValueNullFieldError.checkNotNull(val, 'HealthyStatus', 'val');
  }

  @override
  HealthyStatus rebuild(void Function(HealthyStatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HealthyStatusBuilder toBuilder() => new HealthyStatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HealthyStatus && typ == other.typ && val == other.val;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, typ.hashCode), val.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HealthyStatus')
          ..add('typ', typ)
          ..add('val', val))
        .toString();
  }
}

class HealthyStatusBuilder
    implements Builder<HealthyStatus, HealthyStatusBuilder> {
  _$HealthyStatus? _$v;

  String? _typ;
  String? get typ => _$this._typ;
  set typ(String? typ) => _$this._typ = typ;

  String? _val;
  String? get val => _$this._val;
  set val(String? val) => _$this._val = val;

  HealthyStatusBuilder();

  HealthyStatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _typ = $v.typ;
      _val = $v.val;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HealthyStatus other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HealthyStatus;
  }

  @override
  void update(void Function(HealthyStatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HealthyStatus build() {
    final _$result = _$v ??
        new _$HealthyStatus._(
            typ: BuiltValueNullFieldError.checkNotNull(
                typ, 'HealthyStatus', 'typ'),
            val: BuiltValueNullFieldError.checkNotNull(
                val, 'HealthyStatus', 'val'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

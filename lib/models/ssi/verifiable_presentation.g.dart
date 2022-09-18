// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifiable_presentation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VerifiablePresentation> _$verifiablePresentationSerializer =
    new _$VerifiablePresentationSerializer();
Serializer<VObject> _$vObjectSerializer = new _$VObjectSerializer();
Serializer<VTarget> _$vTargetSerializer = new _$VTargetSerializer();
Serializer<VAgent> _$vAgentSerializer = new _$VAgentSerializer();

class _$VerifiablePresentationSerializer
    implements StructuredSerializer<VerifiablePresentation> {
  @override
  final Iterable<Type> types = const [
    VerifiablePresentation,
    _$VerifiablePresentation
  ];
  @override
  final String wireName = 'VerifiablePresentation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, VerifiablePresentation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'object',
      serializers.serialize(object.object,
          specifiedType: const FullType(VObject)),
      'target',
      serializers.serialize(object.target,
          specifiedType: const FullType(VTarget)),
      'agent',
      serializers.serialize(object.agent,
          specifiedType: const FullType(VAgent)),
    ];

    return result;
  }

  @override
  VerifiablePresentation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VerifiablePresentationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'object':
          result.object.replace(serializers.deserialize(value,
              specifiedType: const FullType(VObject))! as VObject);
          break;
        case 'target':
          result.target.replace(serializers.deserialize(value,
              specifiedType: const FullType(VTarget))! as VTarget);
          break;
        case 'agent':
          result.agent.replace(serializers.deserialize(value,
              specifiedType: const FullType(VAgent))! as VAgent);
          break;
      }
    }

    return result.build();
  }
}

class _$VObjectSerializer implements StructuredSerializer<VObject> {
  @override
  final Iterable<Type> types = const [VObject, _$VObject];
  @override
  final String wireName = 'VObject';

  @override
  Iterable<Object?> serialize(Serializers serializers, VObject object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'itemListElement',
      serializers.serialize(object.itemListElement,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  VObject deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VObjectBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'itemListElement':
          result.itemListElement.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$VTargetSerializer implements StructuredSerializer<VTarget> {
  @override
  final Iterable<Type> types = const [VTarget, _$VTarget];
  @override
  final String wireName = 'VTarget';

  @override
  Iterable<Object?> serialize(Serializers serializers, VTarget object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'identifier',
      serializers.serialize(object.identifier,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VTarget deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VTargetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'identifier':
          result.identifier = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VAgentSerializer implements StructuredSerializer<VAgent> {
  @override
  final Iterable<Type> types = const [VAgent, _$VAgent];
  @override
  final String wireName = 'VAgent';

  @override
  Iterable<Object?> serialize(Serializers serializers, VAgent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'legalName',
      serializers.serialize(object.legalName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  VAgent deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VAgentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'legalName':
          result.legalName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$VerifiablePresentation extends VerifiablePresentation {
  @override
  final VObject object;
  @override
  final VTarget target;
  @override
  final VAgent agent;

  factory _$VerifiablePresentation(
          [void Function(VerifiablePresentationBuilder)? updates]) =>
      (new VerifiablePresentationBuilder()..update(updates))._build();

  _$VerifiablePresentation._(
      {required this.object, required this.target, required this.agent})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        object, r'VerifiablePresentation', 'object');
    BuiltValueNullFieldError.checkNotNull(
        target, r'VerifiablePresentation', 'target');
    BuiltValueNullFieldError.checkNotNull(
        agent, r'VerifiablePresentation', 'agent');
  }

  @override
  VerifiablePresentation rebuild(
          void Function(VerifiablePresentationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VerifiablePresentationBuilder toBuilder() =>
      new VerifiablePresentationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifiablePresentation &&
        object == other.object &&
        target == other.target &&
        agent == other.agent;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, object.hashCode), target.hashCode), agent.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifiablePresentation')
          ..add('object', object)
          ..add('target', target)
          ..add('agent', agent))
        .toString();
  }
}

class VerifiablePresentationBuilder
    implements Builder<VerifiablePresentation, VerifiablePresentationBuilder> {
  _$VerifiablePresentation? _$v;

  VObjectBuilder? _object;
  VObjectBuilder get object => _$this._object ??= new VObjectBuilder();
  set object(VObjectBuilder? object) => _$this._object = object;

  VTargetBuilder? _target;
  VTargetBuilder get target => _$this._target ??= new VTargetBuilder();
  set target(VTargetBuilder? target) => _$this._target = target;

  VAgentBuilder? _agent;
  VAgentBuilder get agent => _$this._agent ??= new VAgentBuilder();
  set agent(VAgentBuilder? agent) => _$this._agent = agent;

  VerifiablePresentationBuilder();

  VerifiablePresentationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _object = $v.object.toBuilder();
      _target = $v.target.toBuilder();
      _agent = $v.agent.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifiablePresentation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VerifiablePresentation;
  }

  @override
  void update(void Function(VerifiablePresentationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifiablePresentation build() => _build();

  _$VerifiablePresentation _build() {
    _$VerifiablePresentation _$result;
    try {
      _$result = _$v ??
          new _$VerifiablePresentation._(
              object: object.build(),
              target: target.build(),
              agent: agent.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'object';
        object.build();
        _$failedField = 'target';
        target.build();
        _$failedField = 'agent';
        agent.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VerifiablePresentation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VObject extends VObject {
  @override
  final BuiltList<String> itemListElement;

  factory _$VObject([void Function(VObjectBuilder)? updates]) =>
      (new VObjectBuilder()..update(updates))._build();

  _$VObject._({required this.itemListElement}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        itemListElement, r'VObject', 'itemListElement');
  }

  @override
  VObject rebuild(void Function(VObjectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VObjectBuilder toBuilder() => new VObjectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VObject && itemListElement == other.itemListElement;
  }

  @override
  int get hashCode {
    return $jf($jc(0, itemListElement.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VObject')
          ..add('itemListElement', itemListElement))
        .toString();
  }
}

class VObjectBuilder implements Builder<VObject, VObjectBuilder> {
  _$VObject? _$v;

  ListBuilder<String>? _itemListElement;
  ListBuilder<String> get itemListElement =>
      _$this._itemListElement ??= new ListBuilder<String>();
  set itemListElement(ListBuilder<String>? itemListElement) =>
      _$this._itemListElement = itemListElement;

  VObjectBuilder();

  VObjectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _itemListElement = $v.itemListElement.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VObject other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VObject;
  }

  @override
  void update(void Function(VObjectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VObject build() => _build();

  _$VObject _build() {
    _$VObject _$result;
    try {
      _$result =
          _$v ?? new _$VObject._(itemListElement: itemListElement.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'itemListElement';
        itemListElement.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VObject', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$VTarget extends VTarget {
  @override
  final String identifier;

  factory _$VTarget([void Function(VTargetBuilder)? updates]) =>
      (new VTargetBuilder()..update(updates))._build();

  _$VTarget._({required this.identifier}) : super._() {
    BuiltValueNullFieldError.checkNotNull(identifier, r'VTarget', 'identifier');
  }

  @override
  VTarget rebuild(void Function(VTargetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VTargetBuilder toBuilder() => new VTargetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VTarget && identifier == other.identifier;
  }

  @override
  int get hashCode {
    return $jf($jc(0, identifier.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VTarget')
          ..add('identifier', identifier))
        .toString();
  }
}

class VTargetBuilder implements Builder<VTarget, VTargetBuilder> {
  _$VTarget? _$v;

  String? _identifier;
  String? get identifier => _$this._identifier;
  set identifier(String? identifier) => _$this._identifier = identifier;

  VTargetBuilder();

  VTargetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _identifier = $v.identifier;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VTarget other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VTarget;
  }

  @override
  void update(void Function(VTargetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VTarget build() => _build();

  _$VTarget _build() {
    final _$result = _$v ??
        new _$VTarget._(
            identifier: BuiltValueNullFieldError.checkNotNull(
                identifier, r'VTarget', 'identifier'));
    replace(_$result);
    return _$result;
  }
}

class _$VAgent extends VAgent {
  @override
  final String legalName;

  factory _$VAgent([void Function(VAgentBuilder)? updates]) =>
      (new VAgentBuilder()..update(updates))._build();

  _$VAgent._({required this.legalName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(legalName, r'VAgent', 'legalName');
  }

  @override
  VAgent rebuild(void Function(VAgentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VAgentBuilder toBuilder() => new VAgentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VAgent && legalName == other.legalName;
  }

  @override
  int get hashCode {
    return $jf($jc(0, legalName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VAgent')..add('legalName', legalName))
        .toString();
  }
}

class VAgentBuilder implements Builder<VAgent, VAgentBuilder> {
  _$VAgent? _$v;

  String? _legalName;
  String? get legalName => _$this._legalName;
  set legalName(String? legalName) => _$this._legalName = legalName;

  VAgentBuilder();

  VAgentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _legalName = $v.legalName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VAgent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VAgent;
  }

  @override
  void update(void Function(VAgentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VAgent build() => _build();

  _$VAgent _build() {
    final _$result = _$v ??
        new _$VAgent._(
            legalName: BuiltValueNullFieldError.checkNotNull(
                legalName, r'VAgent', 'legalName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

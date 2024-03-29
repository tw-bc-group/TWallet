// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vc_type_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<VcType> _$vcTypeSerializer = new _$VcTypeSerializer();

class _$VcTypeSerializer implements StructuredSerializer<VcType> {
  @override
  final Iterable<Type> types = const [VcType, _$VcType];
  @override
  final String wireName = 'VcType';

  @override
  Iterable<Object?> serialize(Serializers serializers, VcType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'content',
      serializers.serialize(object.content,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  VcType deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new VcTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'content':
          result.content.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$VcType extends VcType {
  @override
  final String id;
  @override
  final String name;
  @override
  final String url;
  @override
  final BuiltList<String> content;

  factory _$VcType([void Function(VcTypeBuilder)? updates]) =>
      (new VcTypeBuilder()..update(updates))._build();

  _$VcType._(
      {required this.id,
      required this.name,
      required this.url,
      required this.content})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'VcType', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'VcType', 'name');
    BuiltValueNullFieldError.checkNotNull(url, r'VcType', 'url');
    BuiltValueNullFieldError.checkNotNull(content, r'VcType', 'content');
  }

  @override
  VcType rebuild(void Function(VcTypeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  VcTypeBuilder toBuilder() => new VcTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VcType &&
        id == other.id &&
        name == other.name &&
        url == other.url &&
        content == other.content;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), name.hashCode), url.hashCode),
        content.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VcType')
          ..add('id', id)
          ..add('name', name)
          ..add('url', url)
          ..add('content', content))
        .toString();
  }
}

class VcTypeBuilder implements Builder<VcType, VcTypeBuilder> {
  _$VcType? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  ListBuilder<String>? _content;
  ListBuilder<String> get content =>
      _$this._content ??= new ListBuilder<String>();
  set content(ListBuilder<String>? content) => _$this._content = content;

  VcTypeBuilder();

  VcTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _url = $v.url;
      _content = $v.content.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VcType other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$VcType;
  }

  @override
  void update(void Function(VcTypeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VcType build() => _build();

  _$VcType _build() {
    _$VcType _$result;
    try {
      _$result = _$v ??
          new _$VcType._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'VcType', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'VcType', 'name'),
              url: BuiltValueNullFieldError.checkNotNull(url, r'VcType', 'url'),
              content: content.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'content';
        content.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'VcType', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

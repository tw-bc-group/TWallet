// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WebviewRequest> _$webviewRequestSerializer =
    new _$WebviewRequestSerializer();

class _$WebviewRequestSerializer
    implements StructuredSerializer<WebviewRequest> {
  @override
  final Iterable<Type> types = const [WebviewRequest, _$WebviewRequest];
  @override
  final String wireName = 'WebviewRequest';

  @override
  Iterable<Object> serialize(Serializers serializers, WebviewRequest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'method',
      serializers.serialize(object.method,
          specifiedType: const FullType(WebviewRequestMethod)),
    ];

    return result;
  }

  @override
  WebviewRequest deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WebviewRequestBuilder();

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
        case 'method':
          result.method = serializers.deserialize(value,
                  specifiedType: const FullType(WebviewRequestMethod))
              as WebviewRequestMethod;
          break;
      }
    }

    return result.build();
  }
}

class _$WebviewRequest extends WebviewRequest {
  @override
  final String id;
  @override
  final WebviewRequestMethod method;

  factory _$WebviewRequest([void Function(WebviewRequestBuilder) updates]) =>
      (new WebviewRequestBuilder()..update(updates)).build();

  _$WebviewRequest._({this.id, this.method}) : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('WebviewRequest', 'id');
    }
    if (method == null) {
      throw new BuiltValueNullFieldError('WebviewRequest', 'method');
    }
  }

  @override
  WebviewRequest rebuild(void Function(WebviewRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WebviewRequestBuilder toBuilder() =>
      new WebviewRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WebviewRequest && id == other.id && method == other.method;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, id.hashCode), method.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WebviewRequest')
          ..add('id', id)
          ..add('method', method))
        .toString();
  }
}

class WebviewRequestBuilder
    implements Builder<WebviewRequest, WebviewRequestBuilder> {
  _$WebviewRequest _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  WebviewRequestMethod _method;
  WebviewRequestMethod get method => _$this._method;
  set method(WebviewRequestMethod method) => _$this._method = method;

  WebviewRequestBuilder();

  WebviewRequestBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _method = _$v.method;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WebviewRequest other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$WebviewRequest;
  }

  @override
  void update(void Function(WebviewRequestBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WebviewRequest build() {
    final _$result = _$v ?? new _$WebviewRequest._(id: id, method: method);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

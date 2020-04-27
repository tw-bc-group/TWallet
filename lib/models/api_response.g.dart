// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiResponse<Object>> _$apiResponseNewSerializer =
    new _$ApiResponseNewSerializer();

class _$ApiResponseNewSerializer
    implements StructuredSerializer<ApiResponse<Object>> {
  @override
  final Iterable<Type> types = const [ApiResponse, _$ApiResponseNew];
  @override
  final String wireName = 'ApiResponseNew';

  @override
  Iterable<Object> serialize(
      Serializers serializers, ApiResponse<Object> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(int)),
      'msg',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'result',
      serializers.serialize(object.result, specifiedType: parameterT),
    ];

    return result;
  }

  @override
  ApiResponse<Object> deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new ApiResponseNewBuilder<Object>()
        : serializers.newBuilder(specifiedType) as ApiResponseNewBuilder;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'msg':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'result':
          result.result =
              serializers.deserialize(value, specifiedType: parameterT);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiResponseNew<T> extends ApiResponse<T> {
  @override
  final int code;
  @override
  final String message;
  @override
  final T result;

  factory _$ApiResponseNew([void Function(ApiResponseNewBuilder<T>) updates]) =>
      (new ApiResponseNewBuilder<T>()..update(updates)).build();

  _$ApiResponseNew._({this.code, this.message, this.result}) : super._() {
    if (code == null) {
      throw new BuiltValueNullFieldError('ApiResponseNew', 'code');
    }
    if (message == null) {
      throw new BuiltValueNullFieldError('ApiResponseNew', 'message');
    }
    if (result == null) {
      throw new BuiltValueNullFieldError('ApiResponseNew', 'result');
    }
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('ApiResponseNew', 'T');
    }
  }

  @override
  ApiResponse<T> rebuild(void Function(ApiResponseNewBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseNewBuilder<T> toBuilder() =>
      new ApiResponseNewBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiResponse &&
        code == other.code &&
        message == other.message &&
        result == other.result;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, code.hashCode), message.hashCode), result.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ApiResponseNew')
          ..add('code', code)
          ..add('message', message)
          ..add('result', result))
        .toString();
  }
}

class ApiResponseNewBuilder<T>
    implements Builder<ApiResponse<T>, ApiResponseNewBuilder<T>> {
  _$ApiResponseNew<T> _$v;

  int _code;
  int get code => _$this._code;
  set code(int code) => _$this._code = code;

  String _message;
  String get message => _$this._message;
  set message(String message) => _$this._message = message;

  T _result;
  T get result => _$this._result;
  set result(T result) => _$this._result = result;

  ApiResponseNewBuilder();

  ApiResponseNewBuilder<T> get _$this {
    if (_$v != null) {
      _code = _$v.code;
      _message = _$v.message;
      _result = _$v.result;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiResponse<T> other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ApiResponseNew<T>;
  }

  @override
  void update(void Function(ApiResponseNewBuilder<T>) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ApiResponseNew<T> build() {
    final _$result = _$v ??
        new _$ApiResponseNew<T>._(code: code, message: message, result: result);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

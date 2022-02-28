// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiResponse<Object?>> _$apiResponseSerializer =
    new _$ApiResponseSerializer();

class _$ApiResponseSerializer
    implements StructuredSerializer<ApiResponse<Object?>> {
  @override
  final Iterable<Type> types = const [ApiResponse, _$ApiResponse];
  @override
  final String wireName = 'ApiResponse';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ApiResponse<Object?> object,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = <Object?>[
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
  ApiResponse<Object?> deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final isUnderspecified =
        specifiedType.isUnspecified || specifiedType.parameters.isEmpty;
    if (!isUnderspecified) serializers.expectBuilder(specifiedType);
    final parameterT =
        isUnderspecified ? FullType.object : specifiedType.parameters[0];

    final result = isUnderspecified
        ? new ApiResponseBuilder<Object?>()
        : serializers.newBuilder(specifiedType) as ApiResponseBuilder<Object?>;

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
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

class _$ApiResponse<T> extends ApiResponse<T> {
  @override
  final int code;
  @override
  final String message;
  @override
  final T result;

  factory _$ApiResponse([void Function(ApiResponseBuilder<T>)? updates]) =>
      (new ApiResponseBuilder<T>()..update(updates)).build();

  _$ApiResponse._(
      {required this.code, required this.message, required this.result})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, 'ApiResponse', 'code');
    BuiltValueNullFieldError.checkNotNull(message, 'ApiResponse', 'message');
    BuiltValueNullFieldError.checkNotNull(result, 'ApiResponse', 'result');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError('ApiResponse', 'T');
    }
  }

  @override
  ApiResponse<T> rebuild(void Function(ApiResponseBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiResponseBuilder<T> toBuilder() =>
      new ApiResponseBuilder<T>()..replace(this);

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
    return (newBuiltValueToStringHelper('ApiResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('result', result))
        .toString();
  }
}

class ApiResponseBuilder<T>
    implements Builder<ApiResponse<T>, ApiResponseBuilder<T>> {
  _$ApiResponse<T>? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  T? _result;
  T? get result => _$this._result;
  set result(T? result) => _$this._result = result;

  ApiResponseBuilder();

  ApiResponseBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _result = $v.result;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiResponse<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiResponse<T>;
  }

  @override
  void update(void Function(ApiResponseBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ApiResponse<T> build() {
    final _$result = _$v ??
        new _$ApiResponse<T>._(
            code: BuiltValueNullFieldError.checkNotNull(
                code, 'ApiResponse', 'code'),
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'ApiResponse', 'message'),
            result: BuiltValueNullFieldError.checkNotNull(
                result, 'ApiResponse', 'result'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

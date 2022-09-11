// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ApiError> _$apiErrorSerializer = new _$ApiErrorSerializer();

class _$ApiErrorSerializer implements StructuredSerializer<ApiError> {
  @override
  final Iterable<Type> types = const [ApiError, _$ApiError];
  @override
  final String wireName = 'ApiError';

  @override
  Iterable<Object?> serialize(Serializers serializers, ApiError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'code',
      serializers.serialize(object.code, specifiedType: const FullType(int)),
      'msg',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'result',
      serializers.serialize(object.result,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(String)])),
    ];

    return result;
  }

  @override
  ApiError deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ApiErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'msg':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'result':
          result.result.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(String)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$ApiError extends ApiError {
  @override
  final int code;
  @override
  final String message;
  @override
  final BuiltMap<String, String> result;

  factory _$ApiError([void Function(ApiErrorBuilder)? updates]) =>
      (new ApiErrorBuilder()..update(updates))._build();

  _$ApiError._(
      {required this.code, required this.message, required this.result})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(code, r'ApiError', 'code');
    BuiltValueNullFieldError.checkNotNull(message, r'ApiError', 'message');
    BuiltValueNullFieldError.checkNotNull(result, r'ApiError', 'result');
  }

  @override
  ApiError rebuild(void Function(ApiErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApiErrorBuilder toBuilder() => new ApiErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ApiError &&
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
    return (newBuiltValueToStringHelper(r'ApiError')
          ..add('code', code)
          ..add('message', message)
          ..add('result', result))
        .toString();
  }
}

class ApiErrorBuilder implements Builder<ApiError, ApiErrorBuilder> {
  _$ApiError? _$v;

  int? _code;
  int? get code => _$this._code;
  set code(int? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  MapBuilder<String, String>? _result;
  MapBuilder<String, String> get result =>
      _$this._result ??= new MapBuilder<String, String>();
  set result(MapBuilder<String, String>? result) => _$this._result = result;

  ApiErrorBuilder();

  ApiErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _result = $v.result.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ApiError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ApiError;
  }

  @override
  void update(void Function(ApiErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ApiError build() => _build();

  _$ApiError _build() {
    _$ApiError _$result;
    try {
      _$result = _$v ??
          new _$ApiError._(
              code: BuiltValueNullFieldError.checkNotNull(
                  code, r'ApiError', 'code'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'ApiError', 'message'),
              result: result.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'result';
        result.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ApiError', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

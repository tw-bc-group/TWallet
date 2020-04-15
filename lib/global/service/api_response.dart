import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse<T> {
  final int code;

  @JsonKey(name: 'msg')
  final String message;

  @_Converter()
  final T result;

  ApiResponse(this.code, this.message, this.result);

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    return json as T;
  }

  @override
  Object toJson(T object) {
    return object;
  }
}

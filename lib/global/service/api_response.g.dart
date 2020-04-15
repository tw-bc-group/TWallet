// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) {
  return ApiResponse<T>(
    json['code'] as int,
    json['msg'] as String,
    _Converter<T>().fromJson(json['result']),
  );
}

Map<String, dynamic> _$ApiResponseToJson<T>(ApiResponse<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.message,
      'result': _Converter<T>().toJson(instance.result),
    };

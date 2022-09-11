import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'api_error.g.dart';

abstract class ApiError implements Built<ApiError, ApiErrorBuilder> {
  static Serializer<ApiError> get serializer => _$apiErrorSerializer;
  int get code;
  @BuiltValueField(wireName: 'msg')
  String get message;
  BuiltMap<String, String> get result;

  static ApiError? fromJson(dynamic serialized) {
    try {
      return serializers.deserializeWith(
        serializer,
        serialized,
      );
    } catch (error) {
      throw Exception('apiError deserialize error, $error');
    }
  }

  factory ApiError([Function(ApiErrorBuilder) updates]) = _$ApiError;
  ApiError._();
}

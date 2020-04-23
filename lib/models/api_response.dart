import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'api_response.g.dart';

abstract class ApiResponseNew<T>
    implements Built<ApiResponseNew<T>, ApiResponseNewBuilder<T>> {
  static Serializer<ApiResponseNew> get serializer =>
      _$apiResponseNewSerializer;

  int get code;
  @BuiltValueField(wireName: 'msg')
  String get message;
  T get result;

  static ApiResponseNew fromJson(
      dynamic serialized, List<FullType> parameters) {
    try {
      return serializers.deserialize(serialized,
          specifiedType: FullType(ApiResponseNew, parameters));
    } catch (_) {
      throw Exception('api json deserialize error');
    }
  }

  factory ApiResponseNew([Function(ApiResponseNewBuilder<T>) updates]) =
      _$ApiResponseNew<T>;
  ApiResponseNew._();
}

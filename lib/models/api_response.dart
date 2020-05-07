import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'api_response.g.dart';

abstract class ApiResponse<T>
    implements Built<ApiResponse<T>, ApiResponseBuilder<T>> {
  static Serializer<ApiResponse> get serializer => _$apiResponseSerializer;

  int get code;
  @BuiltValueField(wireName: 'msg')
  String get message;
  T get result;

  static ApiResponse fromJson(dynamic serialized, List<FullType> parameters) {
    try {
      return serializers.deserialize(serialized,
          specifiedType: FullType(ApiResponse, parameters));
    } catch (error) {
      throw Exception('api response deserialize error, $error');
    }
  }

  factory ApiResponse([Function(ApiResponseBuilder<T>) updates]) =
      _$ApiResponse<T>;
  ApiResponse._();
}

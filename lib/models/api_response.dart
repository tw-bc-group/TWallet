import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'api_response.g.dart';

abstract class ApiResponse<T>
    implements Built<ApiResponse<T>, ApiResponseNewBuilder<T>> {
  static Serializer<ApiResponse> get serializer => _$apiResponseNewSerializer;

  int get code;
  @BuiltValueField(wireName: 'msg')
  String get message;
  T get result;

  static ApiResponse fromJson(dynamic serialized, List<FullType> parameters) {
    try {
      return serializers.deserialize(serialized,
          specifiedType: FullType(ApiResponse, parameters));
    } catch (_) {
      throw Exception('api json deserialize error');
    }
  }

  factory ApiResponse([Function(ApiResponseNewBuilder<T>) updates]) =
      _$ApiResponseNew<T>;
  ApiResponse._();
}

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/api_error.dart';
import 'package:tw_wallet_ui/models/api_response.dart';
import 'package:tw_wallet_ui/models/ssi/verified.dart';

void main() {
  group('Api response', () {
    test('should deserialize an Error response', () {
      final data = {
        'code': 400,
        'msg': 'some error',
        'result': {'key': 'value'},
      };

      final error = DioError(
        requestOptions: RequestOptions(path: ''),
        response: Response(
          statusCode: 400,
          data: data,
          requestOptions: RequestOptions(path: ''),
        ),
      );

      final err = ApiError.fromJson(error.response?.data);

      expect(err, isA<ApiError>());
    });

    test('should deserialize an verified result', () {
      final data = {
        "code": 0,
        "msg": "SUCCESS",
        "result": {
          "overdue": "TRUE",
          "revoked": "NOT_SUPPORT",
          "onchain": "NOT_SUPPORT",
          "verify_signature": "TRUE",
          "verify_holder": "NOT_SUPPORT"
        }
      };

      final apiResponse =
          ApiResponse.fromJson(data, const [FullType(Verified)]);

      expect(apiResponse, isA<ApiResponse>());
    });
  });
}

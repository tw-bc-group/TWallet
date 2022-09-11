import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/api_error.dart';

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
  });
}

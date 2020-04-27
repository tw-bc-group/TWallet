import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/views/home/identity/date_validator.dart';

void main() {
  final formats = {
    "9999-20-99": false,
    "2020-20-01": false,
    "999999-01-40": false,
    "2020-01-40": false,
    "01-01-01": false,
    "0001-1-1": false,
    "20201201": false,
    "2020-00-00": false,
    "2020-00-01": false,
    "2020-02-12": true,
  };

  test('should return true/false when inputting various format', () {
    formats.forEach((k, v) => expect(isValidDate(k), v));
  });
}

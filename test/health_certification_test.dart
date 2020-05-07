import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/health_certification.dart';

void main() {
  group('HealthCertification', () {
    test('when deserialize from a map, should be ok.', () {
      expect(
          HealthCertification.fromJson({
            '@context': ['String'],
            'id': 'did',
            'ver': '0.1',
            'iss': 'null',
            'iat': 123,
            'exp': 123,
            'typ': ['HealthyStatus'],
            'sub': {
              'id': 'did',
              'phone': 'aaa',
              'healthyStatus': {'typ': 'HealthyStatus', 'val': 'unhealthy'}
            }
          }),
          isA<HealthCertification>());
    });
  });
}

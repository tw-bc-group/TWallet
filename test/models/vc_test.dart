import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';

void main() {
  group('VC', () {
    test('Create vcpr', () {
      final vcpr = VerifiableCredentialPresentationRequest.fromJson({
        "id": '1',
        "name": "地坛医院",
        "vc_types": ["ItineraryHealthCode", "ImmunoglobulinDetection"]
      });

      expect(vcpr, isA<VerifiableCredentialPresentationRequest>());
      expect(vcpr.id, '1');
      expect(vcpr.name, "地坛医院");
      expect(vcpr.vcTypes, isA<List<String>>());
      expect(vcpr.vcTypes[0], "ItineraryHealthCode");
      expect(vcpr.vcTypes[1], "ImmunoglobulinDetection");
    });
  });
}

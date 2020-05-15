import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/models/did.dart';

void main() {
  getItInit(isTest: true);

  group('DID', () {
    test('Test valid DID parse', () {
      expect(DID.parse('DID:TW:816F81681dC8dd12039c05B0093ccce24B4215f4'),
          isA<DID>());
    });

    test(
        'Test DID to String should be DID:TW:816F81681dC8dd12039c05B0093ccce24B4215f4',
        () {
      expect(
          DID
              .parse('DID:TW:816F81681dC8dd12039c05B0093ccce24B4215f4')
              .toString(),
          'DID:TW:816F81681dC8dd12039c05B0093ccce24B4215f4');
    });

    test(
        'Test DID eip55 address should be 0x816F81681dC8dd12039c05B0093ccce24B4215f4',
        () {
      expect(
          DID
              .parse('DID:TW:816F81681dC8dd12039c05B0093ccce24B4215f4')
              .eip55Address,
          '0x816F81681dC8dd12039c05B0093ccce24B4215f4');
    });

    test('Test invalid address parse, should throw ArgumentError', () {
      expect(() => DID.parse('DID:TW:816F81681dC8dd12039c05B0093ccce24B4215'),
          throwsArgumentError);
    });

    test('Test invalid format parse, should throw ArgumentError', () {
      expect(() => DID.parse('816F81681dC8dd12039c05B0093ccce24B4215f4'),
          throwsArgumentError);
    });
  });
}

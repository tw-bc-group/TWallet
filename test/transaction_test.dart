import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/global/common/get_it.dart';
import 'package:tw_wallet_ui/models/transaction.dart';

void main() {
  getItInit(isTest: true);

  group('Transaction', () {
    test('Transaction deserialize should be successful', () {
      Map<String, dynamic> _serialized = {
        "hash":
            "0x454971ef7eb2377ce00ca2686ab4f6c752e1a437ecf6edb363fff0ca0471ca92",
        "tx_type": "Transfer",
        "amount": "2000000000000000000",
        "create_time": "2020-04-24 06:47:18",
        "from_address": "0x55e9f09e71e33adce530c888f3e1f303bc257248",
        "to_address": "0xc2583ac729840311e32fac95f0fc9076b302f94f",
      };
      expect(Transaction.fromJson(_serialized), isA<Transaction>());
    });
  });
}

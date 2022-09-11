import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/service/identity.dart';

void main() {
  group('contract extension test', () {
    // see https://github.com/tw-bc-group/tw-wallet-contract/blob/master/contracts/Identities.sol
    test('should encode contract indentities to a list of Object', () {
      final identitiesOfCallingSmartContract = [
        ['qianyan'], // names
        ['did:tw:e8D5d9e6bD7D5C4c32ab4E62E708253Fd88d7d78'], // dids
        [], //dappIds
        [BigInt.from(1)], //indexes
        [], // extraInfos
        [
          '0x022de5efc883f3448cf9427360702081ae27380ea8900d95d4e22b8e7ef1e4335c'
        ] //publicKeys
      ];
      final plainIdentities =
          ContractService.assemble(identitiesOfCallingSmartContract);

      expect(plainIdentities, isA<List<Identity>>());
    });
  });
}

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/service/blockchain.dart';

void main() {
  const publicKey =
      '0440b3fa8e848297ff26b04088263101fa87d3541ac48bbc32fe7b77b73246578241236ab6097d4012ac17a514272a54a7b728790e914bbbff431e49d421aa1eef';
  group('Blockchain service', () {
    test(
        'should convert succussfully even there is a 0x prefix in public address',
        () {
      const hexPrefix = '0x';
      final addr = BlockChainService.publicKeyToAddress('$hexPrefix$publicKey');

      expect(addr, '0x9576DB252F79913e4bC5d8BB8F44D3B31054DF42');
    });

    test('should convert succussfully even there is no 0x in public address',
        () {
      final addr = BlockChainService.publicKeyToAddress(publicKey);

      expect(addr, '0x9576DB252F79913e4bC5d8BB8F44D3B31054DF42');
    });
  });
}

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:tw_wallet_ui/models/eth_tx.dart';
import 'package:tw_wallet_ui/service/rlp.dart';
import 'package:web3dart/crypto.dart';

void main() {
  test('rlp decode', () {
    final List<Uint8List> decodedRlp = decode(hexToBytes(
        '0xf8a7820cad808304fe78946b5ae192e2162e4c92cb306a2fb6c0c6cc05fa7a80b84440c10f19000000000000000000000000ed9d02e382b34818e88b88a309c7fe71e65f419d00000000000000000000000000000000000000000043425f3130305f3030303437a09cae9c30916137e11d0287bf0a6b3b2914566fc47f66bdb85c3d9750d954e5a1a0108da090f1451740d727c56464ab7fa856143112b34002730d85ce2fe56d92da'));

    expect(EthTxInfo.fromDecodedRlp(decodedRlp), isA<EthTxInfo>());
  });
}

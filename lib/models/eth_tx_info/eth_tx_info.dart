import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:web3dart/crypto.dart';

// ignore: implementation_imports
import 'package:web3dart/src/utils/rlp.dart' as rlp;

part 'eth_tx_info.g.dart';

abstract class EthTxInfo extends Object
    implements Built<EthTxInfo, EthTxInfoBuilder> {
  static Serializer<EthTxInfo> get serializer => _$ethTxInfoSerializer;

  BigInt get nonce;

  BigInt get gasPrice;

  BigInt get gasLimit;

  String get to;

  BigInt get value;

  Uint8List get data;

  int get v;

  BigInt get r;

  BigInt get s;

  // https://github.com/ethereumjs/ethereumjs-util/blob/8ffe697fafb33cefc7b7ec01c11e3a7da787fe0e/src/signature.ts#L26
  // be aware that signature.v already is recovery + 27
  MsgSignature get msgSignature => MsgSignature(r, s, v + 27 - 55);

  Uint8List get messageHash {
    return keccak256(Uint8List.fromList(rlp.encode([
      nonce,
      gasPrice,
      gasLimit,
      hexToBytes(to),
      value,
      data,
      10,
      BigInt.zero,
      BigInt.zero
    ])));
  }

  factory EthTxInfo([void Function(EthTxInfoBuilder) updates]) = _$EthTxInfo;

  factory EthTxInfo.fromDecodedRlp(List<Uint8List> decodedRlp) {
    return EthTxInfo((builder) => builder
      ..nonce = bytesToInt(decodedRlp[0])
      ..gasPrice = bytesToInt(decodedRlp[1])
      ..gasLimit = bytesToInt(decodedRlp[2])
      ..to = bytesToHex(decodedRlp[3])
      ..value = bytesToInt(decodedRlp[4])
      ..data = decodedRlp[5]
      ..v = bytesToInt(decodedRlp[6]).toInt()
      ..r = bytesToInt(decodedRlp[7])
      ..s = bytesToInt(decodedRlp[8]));
  }

  EthTxInfo._();
}

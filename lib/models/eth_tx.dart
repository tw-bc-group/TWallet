import 'dart:typed_data';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:web3dart/crypto.dart';

part 'eth_tx.g.dart';

abstract class EthTxInfo extends Object
    implements Built<EthTxInfo, EthTxInfoBuilder> {
  static Serializer<EthTxInfo> get serializer => _$ethTxInfoSerializer;

  BigInt get nonce;

  BigInt get gasPrice;

  BigInt get gasLimit;

  String get to;

  BigInt get value;

  Uint8List get data;

  BigInt get v;

  BigInt get r;

  BigInt get s;

  factory EthTxInfo([void Function(EthTxInfoBuilder) updates]) = _$EthTxInfo;

  factory EthTxInfo.fromDecodedRlp(List<Uint8List> decodedRlp) {
    return EthTxInfo((builder) => builder
      ..nonce = bytesToInt(decodedRlp[0])
      ..gasPrice = bytesToInt(decodedRlp[1])
      ..gasLimit = bytesToInt(decodedRlp[2])
      ..to = bytesToHex(decodedRlp[3])
      ..value = bytesToInt(decodedRlp[4])
      ..data = decodedRlp[5]
      ..v = bytesToInt(decodedRlp[6])
      ..r = bytesToInt(decodedRlp[7])
      ..s = bytesToInt(decodedRlp[8]));
  }

  EthTxInfo._();
}

import 'dart:typed_data';

import 'package:more/tuple.dart';
import 'package:web3dart/crypto.dart';
// ignore: implementation_imports
import 'package:web3dart/src/utils/rlp.dart' as rlp;

List<Uint8List> decode(Uint8List data) {
  final Tuple2<dynamic, Uint8List> decoded = _decode(data);

  if ((decoded.second).isNotEmpty) {
    throw Exception('invalid remainder');
  }

  return (decoded.first as List<List<int>>)
      .map((v) => Uint8List.fromList(v))
      .toList();
}

int safeParseInt(String v, int base) {
  if (v.substring(0, 2) == '00') {
    throw Exception('invalid RLP: extra zeros');
  }

  return int.parse(v, radix: base);
}

Tuple2<List<dynamic>, Uint8List> _decode(Uint8List input) {
  int length;
  int tempLength;
  Uint8List data;
  Uint8List innerRemainder;
  Tuple2<dynamic, Uint8List> tempDecoded;

  final List<List<int>> decoded = [];
  final int firstByte = input[0];

  if (firstByte <= 0x7f) {
    return Tuple2(input.sublist(0, 1), input.sublist(1));
  } else if (firstByte <= 0xb7) {
    length = firstByte - 0x7f;

    if (firstByte == 0x80) {
      data = Uint8List(0);
    } else {
      data = input.sublist(1, length);
    }

    if (length == 2 && data[0] < 0x80) {
      throw Exception('invalid rlp encoding: byte must be less 0x80');
    }
    return Tuple2(data, input.sublist(length));
  } else if (firstByte <= 0xbf) {
    tempLength = firstByte - 0xb6;

    if (input.length - 1 < tempLength) {
      throw Exception('invalid RLP: not enough bytes for string length');
    }

    length = safeParseInt(bytesToHex(input.sublist(1, tempLength)), 16);

    if (length <= 55) {
      throw Exception(
        'invalid RLP: expected string length to be greater than 55',
      );
    }

    data = input.sublist(tempLength, length + tempLength);

    if (data.length < length) {
      throw Exception('invalid RLP: not enough bytes for string');
    }

    return Tuple2(data, input.sublist(length + tempLength));
  } else if (firstByte <= 0xf7) {
    length = firstByte - 0xbf;

    innerRemainder = input.sublist(1, length);

    while (innerRemainder.isNotEmpty) {
      tempDecoded = _decode(innerRemainder);
      decoded.add(tempDecoded.first as List<int>);
      innerRemainder = tempDecoded.second;
    }

    return Tuple2(decoded, input.sublist(length));
  } else {
    tempLength = firstByte - 0xf6;

    length = safeParseInt(bytesToHex(input.sublist(1, tempLength)), 16);

    final int totalLength = tempLength + length;

    if (totalLength > input.length) {
      throw Exception('invalid rlp: total length is larger than the data');
    }

    innerRemainder = input.sublist(tempLength, totalLength);

    if (innerRemainder.isEmpty) {
      throw Exception('invalid rlp, List has a invalid length');
    }

    while (innerRemainder.isNotEmpty) {
      tempDecoded = _decode(innerRemainder);
      decoded.add(tempDecoded.first as List<int>);
      innerRemainder = tempDecoded.second;
    }

    return Tuple2(decoded, input.sublist(totalLength));
  }
}

List<int> encode(dynamic value) {
  return rlp.encode(value);
}

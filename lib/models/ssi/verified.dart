import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'verified.g.dart';

abstract class Verified extends Object
    implements Built<Verified, VerifiedBuilder> {
  static Serializer<Verified> get serializer => _$verifiedSerializer;
  String get overdue;
  String get revoked;
  String get onchain;
  @BuiltValueField(wireName: 'verify_signature')
  String get verifySignature;
  @BuiltValueField(wireName: 'verify_holder')
  String get verifyHolder;

  factory Verified([Function(VerifiedBuilder) updates]) = _$Verified;
  Verified._();
}

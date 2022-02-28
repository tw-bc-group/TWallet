import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:tw_wallet_ui/models/serializer.dart';

part 'contract.g.dart';

abstract class Contract extends Object
    implements Built<Contract, ContractBuilder> {
  static Serializer<Contract> get serializer => _$contractSerializer;

  String get name;
  String get address;
  String get abi;
  String? get symbol;
  int? get decimal;

  Map<String, dynamic> toJson() {
    return serializers.serialize(this) as Map<String, dynamic>;
  }

  factory Contract([void Function(ContractBuilder) updates]) = _$Contract;

  factory Contract.fromJson(dynamic serialized) {
    return serializers.deserialize(serialized,
        specifiedType: const FullType(Contract)) as Contract;
  }

  Contract._();
}

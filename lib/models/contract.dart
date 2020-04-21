import 'package:json_annotation/json_annotation.dart';

part 'contract.g.dart';

@JsonSerializable()
class ContractModel {
  final String name;
  final String address;
  final String abi;

  // EthereumAddress get ethAddress => EthereumAddress.fromHex('0x$address');

  factory ContractModel.fromJson(Map<String, dynamic> json) =>
      _$ContractModelFromJson(json);
  ContractModel(this.name, this.address, this.abi);
  Map<String, dynamic> toJson() => _$ContractModelToJson(this);
}

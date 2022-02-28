import 'package:json_annotation/json_annotation.dart';
part 'vc_pass.g.dart';

@JsonSerializable(explicitToJson: true)
class VcPass {
  VcPass({required this.name, required this.token});

  String name;
  String token;

  factory VcPass.fromJson(Map<String, dynamic> json) => _$VcPassFromJson(json);

  Map<String, dynamic> toJson() => _$VcPassToJson(this);
}

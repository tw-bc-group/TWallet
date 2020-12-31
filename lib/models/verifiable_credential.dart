import 'package:json_annotation/json_annotation.dart';
part 'verifiable_credential.g.dart';

class VerifiableCredential {
  String name;

  String issuer;

  VerifiableCredential({this.name, this.issuer});

  // TODO(SSI): vc fields
  List<String> get fields => ["个人信息", "mock"];

  // TODO(SSI): vc application time
  DateTime get applicationTime => DateTime(2020, 1, 1, 1, 1);
}

@JsonSerializable(explicitToJson: true)
class VerifiableCredentialPresentationRequest {
  int id;
  String name;
  @JsonKey(name: 'vc_types')
  List<String> vcTypes;

  VerifiableCredentialPresentationRequest({this.id, this.name, this.vcTypes});

  factory VerifiableCredentialPresentationRequest.fromJson(Map<String, dynamic> json) => _$VerifiableCredentialPresentationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifiableCredentialPresentationRequestToJson(this);
}

// TODO(SSI): VerifiableCredentialPresentation
/*
class VerifiableCredentialPresentation {
  VerifiableCredentialPresentation()
}
*/


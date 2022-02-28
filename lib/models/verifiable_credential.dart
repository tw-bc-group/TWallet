import 'package:json_annotation/json_annotation.dart';
import 'package:validators/validators.dart';

part 'verifiable_credential.g.dart';

class VerifiableCredential {
  String name;
  String issuer;
  String? vcTypeId;
  String? token;
  List<String> content;
  DateTime? applicationTime;

  VerifiableCredential({
    required this.name,
    required this.issuer,
    this.vcTypeId,
    this.token,
    required this.content,
    this.applicationTime,
  });

  bool isMissing() {
    return isNull(token) || token!.isEmpty || applicationTime == null;
  }
}

@JsonSerializable(explicitToJson: true)
class VerifiableCredentialPresentationRequest {
  String id;
  String name;
  @JsonKey(name: 'vc_types')
  List<String> vcTypes;

  VerifiableCredentialPresentationRequest(
      {required this.id, required this.name, required this.vcTypes});

  factory VerifiableCredentialPresentationRequest.fromJson(
          Map<String, dynamic> json) =>
      _$VerifiableCredentialPresentationRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VerifiableCredentialPresentationRequestToJson(this);
}

// TODO(SSI): VerifiableCredentialPresentation
/*
class VerifiableCredentialPresentation {
  VerifiableCredentialPresentation()
}
*/

@JsonSerializable(explicitToJson: true)
class VerifiableCredentialTokenResponse {
  String token;
  VerifiableCredentialTokenResponse({required this.token});

  factory VerifiableCredentialTokenResponse.fromJson(
          Map<String, dynamic> json) =>
      _$VerifiableCredentialTokenResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$VerifiableCredentialTokenResponseToJson(this);
}

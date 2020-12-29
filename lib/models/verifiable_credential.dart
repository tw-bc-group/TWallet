class VerifiableCredential {
  String name;

  String issuer;

  VerifiableCredential({this.name, this.issuer});

  // TODO(SSI): vc fields
  List<String> get fields => ["个人信息", "mock"];

  // TODO(SSI): vc application time
  DateTime get applicationTime => DateTime(2020, 1, 1, 1, 1);
}

// TODO(SSI): VerifiableCredentialPresentationRequest
/*
class VerifiableCredentialPresentationRequest {
  VerifiableCredentialPresentationRequest()
}

// TODO(SSI): VerifiableCredentialPresentation
class VerifiableCredentialPresentation {
  VerifiableCredentialPresentation()
}
*/


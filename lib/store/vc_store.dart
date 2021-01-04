import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/vc_pass.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';

class VcStore {
  final Rx<VerifiableCredentialPresentationRequest> rxVpReq = Rx();
  final Rx<VcPass> rxVcPass = Rx();

  VcStore();

  set vcPass(VcPass vcPass) => rxVcPass.value = vcPass;
  VcPass get vcPass => rxVcPass.value;

  set vpReq(VerifiableCredentialPresentationRequest vcpr) => rxVpReq.value = vcpr;
  VerifiableCredentialPresentationRequest get vpReq => rxVpReq.value;
}

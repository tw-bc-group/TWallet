import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/vc_pass.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';

class VcStore {
  final Rx<VerifiableCredentialPresentationRequest> rxVpReq = Rx();
  final Rx<VcPass> rxVcPass = Rx();
  final RxList<Vc> rxVcs = RxList();

  VcStore();

  set vcPass(VcPass vcPass) => rxVcPass.value = vcPass;
  VcPass get vcPass => rxVcPass.value;

  set vpReq(VerifiableCredentialPresentationRequest vcpr) => rxVpReq.value = vcpr;
  VerifiableCredentialPresentationRequest get vpReq => rxVpReq.value;

  set vcs(List<Vc> vcs) => rxVcs.assignAll(vcs);
  List<Vc> get vcs => rxVcs.toList();

  void addVc(Vc vc) {
    rxVcs.add(vc);
  }
}

class Vc {
  Vc(this.name, this.vcType, this.token);

  String name;
  String vcType;
  String token;
}

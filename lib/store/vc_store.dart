import 'package:get/get.dart';
import 'package:optional/optional.dart';
import 'package:tw_wallet_ui/models/vc_pass.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';

class VcStore {
  final Rx<VerifiableCredentialPresentationRequest?> rxVpReq = Rx(null);
  final Rx<VcPass?> rxVcPass = Rx(null);
  final RxList<VerifiableCredential> rxVcs = RxList();

  VcStore();

  set vcPass(VcPass vcPass) => rxVcPass.value = vcPass;
  VcPass get vcPass => rxVcPass.value!;

  set vpReq(VerifiableCredentialPresentationRequest vcpr) =>
      rxVpReq.value = vcpr;
  VerifiableCredentialPresentationRequest get vpReq => rxVpReq.value!;

  set vcs(List<VerifiableCredential> vcs) => rxVcs.assignAll(vcs);
  List<VerifiableCredential> get vcs => rxVcs.toList();

  void addVc(VerifiableCredential vc) {
    removeVc(vc.vcTypeId!);
    rxVcs.add(vc);
  }

  Optional<String> findVc(String vcTypeId) {
    final vcs = rxVcs.where((vc) => vc.vcTypeId == vcTypeId).toList();
    if (vcs.isEmpty) {
      return const Optional.empty();
    }
    return Optional.of(vcs.last.token!);
  }

  void removeVc(String vcTypeId) {
    rxVcs.removeWhere((vc) => vc.vcTypeId == vcTypeId);
  }
}

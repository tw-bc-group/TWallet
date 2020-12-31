import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/models/vc_pass.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';

part 'vc_store.g.dart';

class VcStore = _VcStore
    with _$VcStore;

abstract class _VcStore with Store {
  VerifiableCredentialPresentationRequest _vcpr;
  VcPass _vcPass;

  Future<void> setRequest(VerifiableCredentialPresentationRequest vcpr) async {
    _vcpr = vcpr;
  }

  Future<void> setPass(VcPass vcPass) async {
    _vcPass = vcPass;
  }

  get vcpr => _vcpr;
  get vcPass => _vcPass;
}

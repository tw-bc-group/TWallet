import 'package:mobx/mobx.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';

part 'vc_store.g.dart';

class VcStore = _VcStore
    with _$VcStore;

abstract class _VcStore with Store {
  VerifiableCredentialPresentationRequest _vcpr;

  Future<void> setRequest(VerifiableCredentialPresentationRequest vcpr) async {
    _vcpr = vcpr;
  }

  get vcpr => _vcpr;
}

import 'package:get/get.dart';
import 'package:tw_wallet_ui/models/verifiable_credential.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:validators/validators.dart';

class SsiService {
  static Future<VerifiableCredentialPresentationRequest>
      createVerifiableCredentialPresentationRequest(String url) async {
    final vp = await Get.find<ApiProvider>().fetchVP(url);
    return VerifiableCredentialPresentationRequest(
      id: vp.target.identifier,
      name: vp.agent.legalName,
      vcTypes: vp.object.itemListElement.toList(),
    );
  }

  static Future<VerifiableCredentialTokenResponse> verifyAndGetPassport(
    String verifierId,
    List<String?> tokens,
  ) async {
    return Get.find<ApiProvider>().verifyAndGetPassport(verifierId, tokens);
  }

  static String getSelectDid() {
    final String did = Get.find<IdentityStore>().selectedIdentityDid;
    if (isNull(did) || did.isEmpty) {
      throw Exception('无法获取did，请创建身份后重试');
    }
    return did;
  }
}

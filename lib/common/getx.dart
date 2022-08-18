import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:magic_sdk/magic_sdk.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/common/http/loading_interceptor.dart';
import 'package:tw_wallet_ui/common/secure_storage.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/service/progress_dialog.dart';
import 'package:tw_wallet_ui/store/apply_vc_info_store.dart';
import 'package:tw_wallet_ui/store/dcep/dcep_store.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/issuer_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';
import 'package:tw_wallet_ui/store/vc_store.dart';
import 'package:tw_wallet_ui/views/ble_payment/common/tx_store.dart';

Future<void> initGlobalDependencies() async {
  Get.put(SecureStorage());
  Get.put(ProgressDialog());
  Get.put(LoadingInterceptor());
  Get.put(magicLink());
  Get.put(LogInterceptor(requestBody: true, responseBody: true));
  Get.put(HttpClient());
  Get.put(ApiProvider());
  await Get.putAsync(MnemonicsStore.init);
  await Get.putAsync(ContractService.init);
  await Get.putAsync(IdentityStore.init);
  Get.put(DcepStore());
  Get.put(HealthCertificationStore());
  Get.put(VcStore());
  Get.put(IssuerStore());
  Get.put(ApplyVcInfoStore());
  await Get.putAsync(OfflineTxStore.init);
}

Magic magicLink() {
  return Magic.custom(
    "pk_live_CCD4C7EF13C55895",
    rpcUrl: 'https://rinkeby.infura.io/v3/f392fa8f8e5448b690169441ea7d43e6',
    chainId: 0x4,
  );
}

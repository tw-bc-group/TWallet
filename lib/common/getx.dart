import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:json_store/json_store.dart';
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

import '../store/web3auth_store.dart';

Future<void> initGlobalDependencies() async {
  Get.put(SecureStorage());
  Get.put(ProgressDialog());
  Get.put(LoadingInterceptor());
  Get.put(LogInterceptor(requestBody: true, responseBody: true));
  Get.put(HttpClient());
  Get.put(ApiProvider());
  // Get.put(magicLink());
  Get.put(web3authInit());
  Get.put(
    JsonStore(dbName: identityStorageName),
    tag: identityStorageName,
  );
  await Get.putAsync(MnemonicsStore.init);
  // await Get.putAsync(MagicLinkStore.init);
  await Get.putAsync(ContractService.init);
  await Get.putAsync(IdentityStore.init);
  Get.put(DcepStore());
  Get.put(HealthCertificationStore());
  Get.put(VcStore());
  Get.put(IssuerStore());
  Get.put(ApplyVcInfoStore());
  await Get.putAsync(OfflineTxStore.init);
}

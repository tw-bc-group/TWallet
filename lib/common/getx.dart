import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tw_wallet_ui/common/http/http_client.dart';
import 'package:tw_wallet_ui/common/http/loading_interceptor.dart';
import 'package:tw_wallet_ui/service/api_provider.dart';
import 'package:tw_wallet_ui/service/contract.dart';
import 'package:tw_wallet_ui/service/progress_dialog.dart';
import 'package:tw_wallet_ui/store/env_store.dart';
import 'package:tw_wallet_ui/store/health_certification_store.dart';
import 'package:tw_wallet_ui/store/identity_store.dart';
import 'package:tw_wallet_ui/store/mnemonics.dart';

Future<void> initGlobalDependencies() async {
  await Get.putAsync(() => EnvStore.init());
  Get.put(ProgressDialog());
  final _loadingInterceptor = Get.put(LoadingInterceptor());
  final _logInterceptor =
      Get.put(LogInterceptor(requestBody: true, responseBody: true));
  final _httpClient =
      Get.put(HttpClient().init(_loadingInterceptor, _logInterceptor));
  Get.put(ApiProvider().init(_httpClient));
  await Get.putAsync(() => MnemonicsStore.init());
  await Get.putAsync(() => ContractService.init());
  await Get.putAsync(() => IdentityStore.init());
  Get.put(HealthCertificationStore());
}

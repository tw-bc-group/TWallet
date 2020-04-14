import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tw_wallet_ui/global/store/identity_store.dart';
import 'package:tw_wallet_ui/global/store/mnemonics.dart';

import 'env.dart';

GetIt getIt = GetIt.instance;

void getItInit() {
  getIt.registerSingleton<Dio>(Dio()
    ..options.baseUrl = API_GATEWAY_BASE_URL
    ..options.connectTimeout = API_GATEWAY_CONNECT_TIMEOUT);

  getIt.registerSingletonAsync<IdentityStore>(IdentityStoreBase.fromJsonStore);
  getIt.registerSingletonAsync<MnemonicsStore>(MnemonicsBase.fromSecretStorage);
}
